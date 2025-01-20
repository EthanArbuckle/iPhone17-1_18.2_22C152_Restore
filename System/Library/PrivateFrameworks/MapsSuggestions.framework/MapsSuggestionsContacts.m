@interface MapsSuggestionsContacts
- (MapsSuggestionsContacts)initWithConnector:(id)a3 networkRequester:(id)a4;
- (NSString)uniqueName;
- (char)readMeCardAddressStringsWithHandler:(id)a3;
- (char)readMeCardWithHandler:(id)a3;
- (id).cxx_construct;
- (id)contactNameForIdentifier:(id)a3;
- (id)dataForContactWithIdentifier:(id)a3;
- (id)friendlyNameForIndentifier:(id)a3;
- (id)initFromResourceDepot:(id)a3;
- (id)profilePictureForIdentifier:(id)a3;
- (void)_q_reloadWithHandler:(uint64_t)a1;
- (void)awaitQueue;
- (void)contactsDidUpdate;
- (void)dealloc;
- (void)registerMeCardObserver:(id)a3;
- (void)unregisterMeCardObserver:(id)a3;
@end

@implementation MapsSuggestionsContacts

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (id)initFromResourceDepot:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      __int16 v14 = 1024;
      int v15 = 126;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsContacts initFromResourceDepot:]";
      __int16 v18 = 2082;
      v19 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!", (uint8_t *)&v12, 0x26u);
    }
    goto LABEL_9;
  }
  v6 = [v4 oneNetworkRequester];

  if (!v6)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      __int16 v14 = 1024;
      int v15 = 127;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsContacts initFromResourceDepot:]";
      __int16 v18 = 2082;
      v19 = "nil == (resourceDepot.oneNetworkRequester)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Network!", (uint8_t *)&v12, 0x26u);
    }
LABEL_9:

    v9 = 0;
    goto LABEL_10;
  }
  v7 = [v5 oneContactsConnector];
  v8 = [v5 oneNetworkRequester];
  self = [(MapsSuggestionsContacts *)self initWithConnector:v7 networkRequester:v8];

  v9 = self;
LABEL_10:

  return v9;
}

- (MapsSuggestionsContacts)initWithConnector:(id)a3 networkRequester:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 101;
      __int16 v33 = 2082;
      v34 = "-[MapsSuggestionsContacts initWithConnector:networkRequester:]";
      __int16 v35 = 2082;
      v36 = "nil == (connector)";
      _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires Contacts connector", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v8)
  {
    v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 102;
      __int16 v33 = 2082;
      v34 = "-[MapsSuggestionsContacts initWithConnector:networkRequester:]";
      __int16 v35 = 2082;
      v36 = "nil == (networkRequester)";
      _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires network requester", buf, 0x26u);
    }
LABEL_11:

    v28 = 0;
    goto LABEL_12;
  }
  v31.receiver = self;
  v31.super_class = (Class)MapsSuggestionsContacts;
  v10 = [(MapsSuggestionsContacts *)&v31 init];
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue((dispatch_queue_t *)buf, @"MapsSuggestionsContacts", v11);
    int v12 = *(OS_dispatch_queue **)buf;
    *(void *)buf = 0;
    innerQueue = v10->_queue._innerQueue;
    v10->_queue._innerQueue = v12;

    __int16 v14 = *(NSString **)&buf[8];
    *(void *)&buf[8] = 0;
    name = v10->_queue._name;
    v10->_queue._name = v14;

    objc_storeStrong((id *)&v10->_connector, a3);
    [(MapsSuggestionsContactsConnector *)v10->_connector setDelegate:v10];
    objc_storeStrong((id *)&v10->_networkRequester, a4);
    __int16 v16 = [[MapsSuggestionsLimitedDictionary alloc] initWithMaximumCapacity:GEOConfigGetInteger()];
    cache = v10->_cache;
    v10->_cache = v16;

    __int16 v18 = [MapsSuggestionsObservers alloc];
    v19 = v10->_queue._innerQueue;
    uint64_t v20 = [(MapsSuggestionsObservers *)v18 initWithCallbackQueue:v19 name:@"MapsSuggestionsMeCardReaderObservers" strong:0];
    meCardObservers = v10->_meCardObservers;
    v10->_meCardObservers = (MapsSuggestionsObservers *)v20;

    currMeCard = v10->_currMeCard;
    v10->_currMeCard = 0;

    v23 = objc_alloc_init(MapsSuggestionsLocaleChangedTrigger);
    localeChangedTrigger = v10->_localeChangedTrigger;
    v10->_localeChangedTrigger = v23;

    [(MapsSuggestionsBaseTrigger *)v10->_localeChangedTrigger registerObserver:v10->_cache];
    v25 = [MapsSuggestionsDarwinNotificationTrigger alloc];
    uint64_t v26 = [(MapsSuggestionsDarwinNotificationTrigger *)v25 initWithNotificationName:*MEMORY[0x1E4F63E50]];
    geoActiveTileGroupChangedTrigger = v10->_geoActiveTileGroupChangedTrigger;
    v10->_geoActiveTileGroupChangedTrigger = (MapsSuggestionsDarwinNotificationTrigger *)v26;

    [(MapsSuggestionsBaseTrigger *)v10->_geoActiveTileGroupChangedTrigger registerObserver:v10->_cache];
  }
  self = v10;
  v28 = self;
LABEL_12:

  return v28;
}

- (void)dealloc
{
  if (self) {
    [(MapsSuggestionsContactsConnector *)self->_connector stopListeningForChanges];
  }
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsContacts;
  [(MapsSuggestionsContacts *)&v3 dealloc];
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

void __60__MapsSuggestionsContacts__fetchMeCardShortcutsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 value];
  v5 = [v3 identifier];
  if (v5)
  {
    if (v4)
    {
      id v6 = [v3 label];
      if ([v6 isEqualToString:*MEMORY[0x1E4F1B6F8]])
      {

        id v7 = [*(id *)(*(void *)(a1 + 32) + 24) singleLineStringFromPostalAddress:v4 addCountryName:1];
        id v8 = [[MapsSuggestionsShortcut alloc] initBackedPlaceholderWithType:2 identifier:@"{TEMP}" originatingAddress:v7 customName:0];
        [*(id *)(a1 + 40) addObject:v8];
      }
      else if ([v6 isEqualToString:*MEMORY[0x1E4F1B770]])
      {

        id v7 = [*(id *)(*(void *)(a1 + 32) + 24) singleLineStringFromPostalAddress:v4 addCountryName:1];
        id v8 = [[MapsSuggestionsShortcut alloc] initBackedPlaceholderWithType:3 identifier:@"{TEMP}" originatingAddress:v7 customName:0];
        [*(id *)(a1 + 48) addObject:v8];
      }
      else
      {
        char v10 = [v6 isEqualToString:*MEMORY[0x1E4F1B760]];

        if ((v10 & 1) == 0)
        {
          GEOFindOrCreateLog();
          __int16 v18 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v23 = [v3 label];
            *(_DWORD *)buf = 138412290;
            objc_super v31 = v23;
            _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_DEBUG, "Skipping CNLabel '%@'", buf, 0xCu);
          }
          id v8 = v18;
          goto LABEL_18;
        }
        id v7 = [*(id *)(*(void *)(a1 + 32) + 24) singleLineStringFromPostalAddress:v4 addCountryName:1];
        id v8 = [[MapsSuggestionsShortcut alloc] initBackedPlaceholderWithType:5 identifier:@"{TEMP}" originatingAddress:v7 customName:0];
        [*(id *)(a1 + 56) addObject:v8];
      }

      [*(id *)(a1 + 64) setObject:v8 forKey:v5];
      id v11 = v4;
      int v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:100];
      v13 = [v11 street];
      [v12 appendString:v13];

      __int16 v14 = [v11 subLocality];
      [v12 appendString:v14];

      int v15 = [v11 city];
      [v12 appendString:v15];

      __int16 v16 = [v11 state];
      [v12 appendString:v16];

      v17 = [v11 ISOCountryCode];
      [v12 appendString:v17];

      [v12 appendString:@"MeCard"];
      __int16 v18 = [v12 copy];

      v19 = [*(id *)(a1 + 72) objectForKeyedSubscript:v18];
      if (v19)
      {
        [v8 setGeoMapItem:v19];
        uint64_t v20 = MapsSuggestionsShortcutUniqueIdentifier(v8);
        [v8 setIdentifier:v20];

        v21 = MapsSuggestionsShortcutIdentifierForStorage(v8);
        [v8 setStorageIdentifier:v21];
      }
      else
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 80));
        v22 = *(void **)(*(void *)(a1 + 32) + 32);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __60__MapsSuggestionsContacts__fetchMeCardShortcutsWithHandler___block_invoke_35;
        v24[3] = &unk_1E5CB81C0;
        id v25 = *(id *)(a1 + 80);
        id v26 = v11;
        v27 = v8;
        id v28 = *(id *)(a1 + 72);
        v29 = v18;
        [v22 canonicalLocalSearchPostalAddress:v26 completion:v24];
      }
LABEL_18:

      goto LABEL_19;
    }
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      objc_super v31 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      __int16 v32 = 1024;
      int v33 = 216;
      __int16 v34 = 2082;
      __int16 v35 = "-[MapsSuggestionsContacts _fetchMeCardShortcutsWithHandler:]_block_invoke";
      __int16 v36 = 2082;
      uint64_t v37 = "nil == (postalAddressValue)";
      v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a CNLabeledValue<CNPostalAddress>.value";
      goto LABEL_9;
    }
  }
  else
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      objc_super v31 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      __int16 v32 = 1024;
      int v33 = 215;
      __int16 v34 = 2082;
      __int16 v35 = "-[MapsSuggestionsContacts _fetchMeCardShortcutsWithHandler:]_block_invoke";
      __int16 v36 = 2082;
      uint64_t v37 = "nil == (postalAddressIdentifier)";
      v9 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a CNLabeledValue<CNPostalAddress>.identifier";
LABEL_9:
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, v9, buf, 0x26u);
    }
  }
LABEL_19:
}

void __60__MapsSuggestionsContacts__fetchMeCardShortcutsWithHandler___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (v6 || ![v5 count])
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138412546;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "Didn't find postalAddress %@: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    char v10 = [v5 firstObject];
    id v11 = MapsSuggestionsMapItemConvertIfNeeded(v10);
    [*(id *)(a1 + 48) setGeoMapItem:v11];

    int v12 = MapsSuggestionsShortcutUniqueIdentifier(*(void **)(a1 + 48));
    [*(id *)(a1 + 48) setIdentifier:v12];

    v13 = [*(id *)(a1 + 48) geoMapItem];
    [*(id *)(a1 + 56) setObject:v13 forKeyedSubscript:*(void *)(a1 + 64)];

    __int16 v14 = MapsSuggestionsShortcutIdentifierForStorage(*(void **)(a1 + 48));
    [*(id *)(a1 + 48) setStorageIdentifier:v14];
  }
  dispatch_group_leave(v7);
}

void __60__MapsSuggestionsContacts__fetchMeCardShortcutsWithHandler___block_invoke_38(id *a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[5], "count") + objc_msgSend(a1[4], "count") + objc_msgSend(a1[6], "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v30 = a1;
  id v3 = a1[4];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v40 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v8 = [v7 geoMapItem];
        if (v8)
        {
          uint64_t v9 = [v7 identifier];
          char v10 = [v9 isEqualToString:@"{TEMP}"];

          if ((v10 & 1) == 0) {
            [v2 addObject:v7];
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v4);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = v30[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v11);
        }
        int v15 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        uint64_t v16 = [v15 geoMapItem];
        if (v16)
        {
          __int16 v17 = [v15 identifier];
          char v18 = [v17 isEqualToString:@"{TEMP}"];

          if ((v18 & 1) == 0) {
            [v2 addObject:v15];
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v12);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v19 = v30[6];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = *(void **)(*((void *)&v31 + 1) + 8 * k);
        v24 = [v23 geoMapItem];
        if (v24)
        {
          id v25 = [v23 identifier];
          char v26 = [v25 isEqualToString:@"{TEMP}"];

          if ((v26 & 1) == 0) {
            [v2 addObject:v23];
          }
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v20);
  }

  v27 = (void (**)(id, void *, void *, void))v30[8];
  id v28 = (void *)[v2 copy];
  v29 = (void *)[v30[7] copy];
  v27[2](v27, v28, v29, 0);
}

- (void)registerMeCardObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  meCardObservers = self->_meCardObservers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__MapsSuggestionsContacts_registerMeCardObserver___block_invoke;
  v9[3] = &unk_1E5CB8238;
  objc_copyWeak(&v10, &location);
  [(MapsSuggestionsObservers *)meCardObservers registerObserver:v4 handler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__MapsSuggestionsContacts_registerMeCardObserver___block_invoke_41;
  v7[3] = &unk_1E5CB8260;
  id v6 = v4;
  id v8 = v6;
  MSg::Queue::async<MapsSuggestionsContacts>((NSObject **)&self->_queue, self, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __50__MapsSuggestionsContacts_registerMeCardObserver___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v3 = (id *)WeakRetained;
    if (WeakRetained)
    {
      dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
      [v3[3] startListeningForChanges];
    }
    else
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136446722;
        id v6 = "MapsSuggestionsContacts.mm";
        __int16 v7 = 1026;
        int v8 = 308;
        __int16 v9 = 2082;
        id v10 = "-[MapsSuggestionsContacts registerMeCardObserver:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

void __50__MapsSuggestionsContacts_registerMeCardObserver___block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3[7]) {
    objc_msgSend(*(id *)(a1 + 32), "meCardReader:didUpdateMeCard:", v3);
  }
}

- (void)unregisterMeCardObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  meCardObservers = self->_meCardObservers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__MapsSuggestionsContacts_unregisterMeCardObserver___block_invoke;
  v6[3] = &unk_1E5CB8238;
  objc_copyWeak(&v7, &location);
  [(MapsSuggestionsObservers *)meCardObservers unregisterObserver:v4 handler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__MapsSuggestionsContacts_unregisterMeCardObserver___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v3 = (id *)WeakRetained;
    if (WeakRetained)
    {
      dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
      [v3[3] stopListeningForChanges];
    }
    else
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136446722;
        id v6 = "MapsSuggestionsContacts.mm";
        __int16 v7 = 1026;
        int v8 = 329;
        __int16 v9 = 2082;
        id v10 = "-[MapsSuggestionsContacts unregisterMeCardObserver:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (char)readMeCardWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__MapsSuggestionsContacts_readMeCardWithHandler___block_invoke;
    v9[3] = &unk_1E5CB8288;
    id v10 = v4;
    MSg::Queue::async<MapsSuggestionsContacts>((NSObject **)&self->_queue, self, v9);
    char v6 = 1;
    __int16 v7 = v10;
  }
  else
  {
    __int16 v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      __int16 v13 = 1024;
      int v14 = 338;
      __int16 v15 = 2082;
      uint64_t v16 = "-[MapsSuggestionsContacts readMeCardWithHandler:]";
      __int16 v17 = 2082;
      char v18 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    char v6 = 0;
  }

  return v6;
}

void __49__MapsSuggestionsContacts_readMeCardWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)_q_reloadWithHandler:(uint64_t)a1
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
      objc_initWeak(&location, (id)a1);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      long long v34 = __48__MapsSuggestionsContacts__q_reloadWithHandler___block_invoke;
      long long v35 = &unk_1E5CB82D8;
      objc_copyWeak(&v37, &location);
      id v36 = v4;
      int v5 = v33;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
      if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 3) >= 2)
      {
        char v26 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[MapsSuggestionsContacts _fetchMeCardShortcutsWithHandler:]";
          _os_log_impl(&dword_1A70DF000, v26, OS_LOG_TYPE_DEBUG, "%s :Not Allowed to use Contacts", buf, 0xCu);
        }

        id v27 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
        v34((uint64_t)v5, (void *)MEMORY[0x1E4F1CBF0], v27, 0);
      }
      else
      {
        char v6 = *(void **)(a1 + 24);
        v53[0] = *MEMORY[0x1E4F1AF10];
        __int16 v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
        id v45 = 0;
        long long v31 = [v6 _crossPlatformUnifiedMeContactWithKeysToFetch:v7 error:&v45];
        id v32 = v45;

        int v8 = v31;
        if (!v31 || v32)
        {
          v34((uint64_t)v5, 0, 0, v32);
        }
        else
        {
          v30 = [v31 postalAddresses];
          __int16 v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v30, "count"));
          id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v30, "count"));
          uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v30, "count"));
          uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v30, "count"));
          id v13 = *(id *)(a1 + 40);
          dispatch_group_t v14 = dispatch_group_create();
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __60__MapsSuggestionsContacts__fetchMeCardShortcutsWithHandler___block_invoke;
          *(void *)&buf[24] = &unk_1E5CB81E8;
          *(void *)&buf[32] = a1;
          id v15 = v9;
          id v47 = v15;
          id v16 = v10;
          id v48 = v16;
          id v17 = v11;
          id v49 = v17;
          id v18 = v12;
          id v50 = v18;
          id v51 = v13;
          dispatch_group_t v52 = v14;
          uint64_t v19 = v14;
          id v29 = v13;
          [v30 enumerateObjectsUsingBlock:buf];
          uint64_t v20 = *(NSObject **)(a1 + 8);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __60__MapsSuggestionsContacts__fetchMeCardShortcutsWithHandler___block_invoke_38;
          block[3] = &unk_1E5CB8210;
          id v40 = v15;
          id v41 = v16;
          id v42 = v17;
          uint64_t v21 = v5;
          id v43 = v18;
          id v44 = v21;
          id v22 = v18;
          id v23 = v17;
          id v24 = v16;
          id v28 = v15;
          dispatch_group_notify(v19, v20, block);

          int v8 = v31;
        }

        id v27 = v32;
      }

      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
    }
    else
    {
      id v25 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 349;
        *(_WORD *)&unsigned char buf[18] = 2082;
        *(void *)&buf[20] = "-[MapsSuggestionsContacts _q_reloadWithHandler:]";
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = "nil == (handler)";
        _os_log_impl(&dword_1A70DF000, v25, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
      }
    }
  }
}

void __48__MapsSuggestionsContacts__q_reloadWithHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  __int16 v9 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    uint64_t v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      char v26 = "MapsSuggestionsContacts.mm";
      __int16 v27 = 1026;
      int v28 = 355;
      __int16 v29 = 2082;
      v30 = "-[MapsSuggestionsContacts _q_reloadWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    id v16 = v19;
    goto LABEL_20;
  }
  if (!v7 || v9)
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      char v26 = v9;
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "Error loading Shortcuts from MeCard: %@", buf, 0xCu);
    }

    uint64_t v12 = v9;
    uint64_t v13 = [v12 code];
    if (v13 == 100 || v13 == 103 || v13 == 200)
    {
      dispatch_group_t v14 = [v12 domain];
      char v15 = [v14 isEqualToString:*MEMORY[0x1E4F1AFD8]];

      if (v15)
      {

        id v7 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_11;
      }
    }
    else
    {
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_21;
  }
LABEL_11:
  id v16 = WeakRetained[7];
  id v17 = [[MapsSuggestionsMeCard alloc] initWithShortcuts:v7 perCNPostalAddress:v8 hasCorrected:0 hasGeocoded:1];
  id v18 = WeakRetained[7];
  WeakRetained[7] = v17;

  uint64_t v19 = [WeakRetained[7] copy];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if ([v19 hasHomeOrWorkOrSchool]) {
    MapsSuggestionsSawHomeOrWorkOnThisDevice();
  }
  if (([v19 isEqualToMeCard:v16] & 1) == 0)
  {
    uint64_t v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      char v26 = (char *)v19;
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "New MeCard detected: %@", buf, 0xCu);
    }

    id v21 = WeakRetained[6];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __48__MapsSuggestionsContacts__q_reloadWithHandler___block_invoke_45;
    v23[3] = &unk_1E5CB82B0;
    v23[4] = WeakRetained;
    id v22 = v19;
    id v24 = v22;
    [v21 callBlock:v23];

    uint64_t v19 = v22;
  }
LABEL_20:

LABEL_21:
}

void __48__MapsSuggestionsContacts__q_reloadWithHandler___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  GEOFindOrCreateLog();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = [v3 uniqueName];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Calling observer '%@'", (uint8_t *)&v6, 0xCu);
  }
  [v3 meCardReader:*(void *)(a1 + 32) didUpdateMeCard:*(void *)(a1 + 40)];
}

- (void)contactsDidUpdate
{
}

void __44__MapsSuggestionsContacts_contactsDidUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
}

void __66__MapsSuggestionsContacts__q_readMeCardAddressStringsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 value];
  if (v4)
  {
    id v5 = [v3 label];
    if ([v5 isEqualToString:*MEMORY[0x1E4F1B6F8]])
    {

      int v6 = [*(id *)(*(void *)(a1 + 32) + 24) singleLineStringFromPostalAddress:v4 addCountryName:1];
      if (v6) {
        [*(id *)(a1 + 40) addObject:v6];
      }
    }
    else if ([v5 isEqualToString:*MEMORY[0x1E4F1B770]])
    {

      int v6 = [*(id *)(*(void *)(a1 + 32) + 24) singleLineStringFromPostalAddress:v4 addCountryName:1];
      if (v6) {
        [*(id *)(a1 + 48) addObject:v6];
      }
    }
    else
    {
      char v7 = [v5 isEqualToString:*MEMORY[0x1E4F1B760]];

      if (v7)
      {
        int v6 = [*(id *)(*(void *)(a1 + 32) + 24) singleLineStringFromPostalAddress:v4 addCountryName:1];
        if (v6) {
          [*(id *)(a1 + 56) addObject:v6];
        }
      }
      else
      {
        GEOFindOrCreateLog();
        uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          __int16 v9 = [v3 label];
          int v10 = 138412290;
          uint64_t v11 = v9;
          _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Skipping CNLabel '%@'", (uint8_t *)&v10, 0xCu);
        }
        int v6 = 0;
      }
    }
  }
  else
  {
    int v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446978;
      uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      __int16 v12 = 1024;
      int v13 = 417;
      __int16 v14 = 2082;
      char v15 = "-[MapsSuggestionsContacts _q_readMeCardAddressStringsWithHandler:]_block_invoke";
      __int16 v16 = 2082;
      id v17 = "nil == (postalAddressValue)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a CNLabeledValue<CNPostalAddress>.value", (uint8_t *)&v10, 0x26u);
    }
  }
}

- (char)readMeCardAddressStringsWithHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 3) >= 2)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__MapsSuggestionsContacts_readMeCardAddressStringsWithHandler___block_invoke;
      block[3] = &unk_1E5CB8368;
      uint64_t v11 = v4;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);
      char v5 = 1;
      int v6 = v11;
    }
    else
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __63__MapsSuggestionsContacts_readMeCardAddressStringsWithHandler___block_invoke_51;
      v8[3] = &unk_1E5CB8288;
      __int16 v9 = v4;
      MSg::Queue::async<MapsSuggestionsContacts>((NSObject **)&self->_queue, self, v8);
      char v5 = 1;
      int v6 = v9;
    }
  }
  else
  {
    int v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      __int16 v14 = 1024;
      int v15 = 461;
      __int16 v16 = 2082;
      id v17 = "-[MapsSuggestionsContacts readMeCardAddressStringsWithHandler:]";
      __int16 v18 = 2082;
      uint64_t v19 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    char v5 = 0;
  }

  return v5;
}

uint64_t __63__MapsSuggestionsContacts_readMeCardAddressStringsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    char v5 = "-[MapsSuggestionsContacts readMeCardAddressStringsWithHandler:]_block_invoke";
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "%s :Not Allowed to use Contacts", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__MapsSuggestionsContacts_readMeCardAddressStringsWithHandler___block_invoke_51(uint64_t a1, uint64_t a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, id, id, id, id))*(id *)(a1 + 32);
  if (a2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    int v4 = *(void **)(a2 + 24);
    v20[0] = *MEMORY[0x1E4F1AF10];
    char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v19 = 0;
    uint64_t v6 = [v4 _crossPlatformUnifiedMeContactWithKeysToFetch:v5 error:&v19];
    id v7 = v19;

    uint64_t v8 = [v6 postalAddresses];
    __int16 v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    int v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__MapsSuggestionsContacts__q_readMeCardAddressStringsWithHandler___block_invoke;
    v15[3] = &unk_1E5CB8340;
    v15[4] = a2;
    id v12 = v9;
    id v16 = v12;
    id v13 = v10;
    id v17 = v13;
    id v14 = v11;
    id v18 = v14;
    [v8 enumerateObjectsUsingBlock:v15];
    v3[2](v3, v12, v13, v14, v7);
  }
}

- (id)contactNameForIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v4 = (char *)a3;
  if (!v4)
  {
    char v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      id v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      __int16 v15 = 1024;
      int v16 = 478;
      __int16 v17 = 2082;
      id v18 = "-[MapsSuggestionsContacts contactNameForIdentifier:]";
      __int16 v19 = 2082;
      uint64_t v20 = "nil == (identifier)";
      uint64_t v8 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an identifier";
      __int16 v9 = v5;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 38;
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v9, v10, v8, (uint8_t *)&v13, v11);
    }
LABEL_11:
    uint64_t v6 = 0;
    goto LABEL_16;
  }
  if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 3) >= 2)
  {
    char v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      id v14 = "-[MapsSuggestionsContacts contactNameForIdentifier:]";
      uint64_t v8 = "%s :Not Allowed to use Contacts";
      __int16 v9 = v5;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
      uint32_t v11 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  char v5 = [(MapsSuggestionsContactsConnector *)self->_connector contactForIdentifier:v4];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1B910] stringFromContact:v5 style:0];
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "Formatted contact name : %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "No contacts found for identifier %@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v6 = 0;
  }

LABEL_16:
  return v6;
}

- (id)friendlyNameForIndentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    char v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136446978;
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      __int16 v22 = 1024;
      int v23 = 496;
      __int16 v24 = 2082;
      id v25 = "-[MapsSuggestionsContacts friendlyNameForIndentifier:]";
      __int16 v26 = 2082;
      __int16 v27 = "nil == (identifier)";
      __int16 v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an identifier";
      int v16 = v5;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      uint32_t v18 = 38;
LABEL_11:
      _os_log_impl(&dword_1A70DF000, v16, v17, v15, (uint8_t *)&v20, v18);
    }
LABEL_12:
    int v13 = 0;
    goto LABEL_17;
  }
  if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 3) >= 2)
  {
    char v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 136315138;
      uint64_t v21 = "-[MapsSuggestionsContacts friendlyNameForIndentifier:]";
      __int16 v15 = "%s :Not Allowed to use Contacts";
      int v16 = v5;
      os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
      uint32_t v18 = 12;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  char v5 = [(MapsSuggestionsContactsConnector *)self->_connector contactForIdentifier:v4];
  if (v5)
  {
    uint64_t v6 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    id v7 = [v5 namePrefix];
    [v6 setNamePrefix:v7];

    uint64_t v8 = [v5 givenName];
    [v6 setGivenName:v8];

    __int16 v9 = [v5 middleName];
    [v6 setMiddleName:v9];

    os_log_type_t v10 = [v5 familyName];
    [v6 setFamilyName:v10];

    uint32_t v11 = [v5 nameSuffix];
    [v6 setNameSuffix:v11];

    id v12 = [v5 nickname];
    [v6 setNickname:v12];

    int v13 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v6 style:1 options:0];
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138412290;
      uint64_t v21 = v13;
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Proposed friendly name: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "Trying to fetch a friendly contact name returned nil", (uint8_t *)&v20, 2u);
    }
    int v13 = 0;
  }

LABEL_17:
  return v13;
}

- (id)profilePictureForIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 3) < 2)
    {
      char v5 = [(MapsSuggestionsContactsConnector *)self->_connector imageDataForIdentifier:v4];
      goto LABEL_10;
    }
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315138;
      int v13 = "-[MapsSuggestionsContacts profilePictureForIdentifier:]";
      id v7 = "%s :Not Allowed to use Contacts";
      uint64_t v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
      uint32_t v10 = 12;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      __int16 v14 = 1024;
      int v15 = 524;
      __int16 v16 = 2082;
      os_log_type_t v17 = "-[MapsSuggestionsContacts profilePictureForIdentifier:]";
      __int16 v18 = 2082;
      __int16 v19 = "nil == (identifier)";
      id v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an identifier";
      uint64_t v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 38;
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }

  char v5 = 0;
LABEL_10:

  return v5;
}

- (id)dataForContactWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 3) < 2)
    {
      char v5 = [(MapsSuggestionsContactsConnector *)self->_connector dataForContactWithIdentifier:v4];
      goto LABEL_10;
    }
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315138;
      int v13 = "-[MapsSuggestionsContacts dataForContactWithIdentifier:]";
      id v7 = "%s :Not Allowed to use Contacts";
      uint64_t v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
      uint32_t v10 = 12;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsContacts.mm";
      __int16 v14 = 1024;
      int v15 = 532;
      __int16 v16 = 2082;
      os_log_type_t v17 = "-[MapsSuggestionsContacts dataForContactWithIdentifier:]";
      __int16 v18 = 2082;
      __int16 v19 = "nil == (identifier)";
      id v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an identifier";
      uint64_t v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 38;
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }

  char v5 = 0;
LABEL_10:

  return v5;
}

- (void)awaitQueue
{
}

void __37__MapsSuggestionsContacts_awaitQueue__block_invoke()
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoActiveTileGroupChangedTrigger, 0);
  objc_storeStrong((id *)&self->_localeChangedTrigger, 0);
  objc_storeStrong((id *)&self->_currMeCard, 0);
  objc_storeStrong((id *)&self->_meCardObservers, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_connector, 0);

  innerQueue = self->_queue._innerQueue;
}

@end