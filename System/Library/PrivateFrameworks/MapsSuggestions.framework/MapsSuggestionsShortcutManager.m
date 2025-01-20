@interface MapsSuggestionsShortcutManager
- (BOOL)usingMyPlaces;
- (MapsSuggestionsShortcutManager)initWithStorage:(id)a3 suggestor:(id)a4 contacts:(id)a5 routine:(id)a6 mapsSync:(id)a7 usingMyPlaces:(BOOL)a8;
- (NSString)uniqueName;
- (char)addOrUpdateShortcuts:(id)a3 handler:(id)a4;
- (char)loadAllShortcutsWithHandler:(id)a3;
- (char)moveShortcut:(id)a3 afterShortcut:(id)a4 handler:(id)a5;
- (char)moveShortcut:(id)a3 beforeShortcut:(id)a4 handler:(id)a5;
- (char)moveShortcut:(id)a3 toIndex:(int64_t)a4 withSnapshot:(id)a5 handler:(id)a6;
- (char)moveShortcutToBack:(id)a3 handler:(id)a4;
- (char)moveShortcutToFront:(id)a3 handler:(id)a4;
- (char)proposeAdditionalShortcutsOfType:(int64_t)a3 handler:(id)a4;
- (char)readMeCardWithHandler:(id)a3;
- (char)removeShortcuts:(id)a3 handler:(id)a4;
- (id).cxx_construct;
- (id)initFromResourceDepot:(id)a3;
- (id)routine;
- (id)storage;
- (id)suggestor;
- (id)test_setUpPlaceholdersIfNeeded:(id)a3 overlays:(id)a4;
- (uint64_t)_loadCorrectedMeCardWithHandler:(uint64_t)a1;
- (void)mapsSync:(id)a3 didChangeForContentType:(int64_t)a4;
- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4;
- (void)registerMeCardObserver:(id)a3;
- (void)test_sortMapsSuggestionsShortcuts:(id)a3;
- (void)unregisterMeCardObserver:(id)a3;
@end

@implementation MapsSuggestionsShortcutManager

uint64_t __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_2_230(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6 || ![v5 count])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_229;
      block[3] = &unk_1E5CB8EA0;
      v18 = *(id *)(a1 + 32);
      id v17 = v6;
      dispatch_async(*((dispatch_queue_t *)WeakRetained + 1), block);

      v8 = v18;
    }
    else
    {
      v9 = [[MapsSuggestionsMeCard alloc] initWithShortcuts:v5 hasCorrected:1 hasGeocoded:1];
      objc_storeStrong((id *)WeakRetained + 12, v9);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_2_230;
      v12[3] = &unk_1E5CB8E50;
      id v10 = *(id *)(a1 + 32);
      id v14 = 0;
      id v15 = v10;
      v13 = v9;
      v11 = *((void *)WeakRetained + 1);
      v8 = v9;
      dispatch_async(v11, v12);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "MapsSuggestionsShortcutManager.mm";
      __int16 v21 = 1026;
      int v22 = 1051;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsShortcutManager readMeCardWithHandler:]_block_invoke_2";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)registerMeCardObserver:(id)a3
{
}

- (id)initFromResourceDepot:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 104;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager initFromResourceDepot:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!", (uint8_t *)&v18, 0x26u);
    }
    goto LABEL_21;
  }
  id v6 = [v4 oneFavoritesStorage];

  if (!v6)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 105;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager initFromResourceDepot:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (resourceDepot.oneFavoritesStorage)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one FavouritesStorage!", (uint8_t *)&v18, 0x26u);
    }
    goto LABEL_21;
  }
  v7 = [v5 oneFavoritesSuggestor];

  if (!v7)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 106;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager initFromResourceDepot:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (resourceDepot.oneFavoritesSuggestor)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one FavouritesSuggestor!", (uint8_t *)&v18, 0x26u);
    }
    goto LABEL_21;
  }
  v8 = [v5 oneContacts];

  if (!v8)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 107;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager initFromResourceDepot:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (resourceDepot.oneContacts)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Contacts!", (uint8_t *)&v18, 0x26u);
    }
    goto LABEL_21;
  }
  v9 = [v5 oneRoutine];

  if (!v9)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 108;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager initFromResourceDepot:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (resourceDepot.oneRoutine)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Routine!", (uint8_t *)&v18, 0x26u);
    }
LABEL_21:

    id v15 = 0;
    goto LABEL_22;
  }
  id v10 = [v5 oneFavoritesStorage];
  v11 = [v5 oneFavoritesSuggestor];
  v12 = [v5 oneContacts];
  v13 = [v5 oneRoutine];
  id v14 = [v5 oneMapsSync];
  self = [(MapsSuggestionsShortcutManager *)self initWithStorage:v10 suggestor:v11 contacts:v12 routine:v13 mapsSync:v14 usingMyPlaces:1];

  id v15 = self;
LABEL_22:

  return v15;
}

- (MapsSuggestionsShortcutManager)initWithStorage:(id)a3 suggestor:(id)a4 contacts:(id)a5 routine:(id)a6 mapsSync:(id)a7 usingMyPlaces:(BOOL)a8
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v39 = a4;
  id v40 = a5;
  id v41 = a6;
  id v42 = a7;
  v45.receiver = self;
  v45.super_class = (Class)MapsSuggestionsShortcutManager;
  id v15 = [(MapsSuggestionsShortcutManager *)&v45 init];
  v16 = v15;
  if (v15)
  {
    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue((dispatch_queue_t *)&buf, @"MapsSuggestionsShortcutManagerQueue", v17);
    int v18 = (OS_dispatch_queue *)buf;
    *(void *)&long long buf = 0;
    innerQueue = v15->_queue._innerQueue;
    v15->_queue._innerQueue = v18;

    __int16 v20 = (NSString *)*((void *)&buf + 1);
    *((void *)&buf + 1) = 0;
    name = v15->_queue._name;
    v15->_queue._name = v20;

    p_storage = (id *)&v15->_storage;
    objc_storeStrong((id *)&v15->_storage, a3);
    objc_storeStrong((id *)&v15->_suggestor, a4);
    objc_storeStrong((id *)&v15->_contacts, a5);
    objc_storeStrong((id *)&v15->_routine, a6);
    objc_storeStrong((id *)&v15->_mapsSync, a7);
    __int16 v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    hiddenShortcuts = v15->_hiddenShortcuts;
    v15->_hiddenShortcuts = v23;

    rawMeCard = v15->_rawMeCard;
    v15->_rawMeCard = 0;

    rawHomeAddressStrings = v15->_rawHomeAddressStrings;
    v15->_rawHomeAddressStrings = 0;

    rawWorkAddressStrings = v15->_rawWorkAddressStrings;
    v15->_rawWorkAddressStrings = 0;

    rawSchoolAddressStrings = v15->_rawSchoolAddressStrings;
    v15->_rawSchoolAddressStrings = 0;

    currCorrectedMeCard = v15->_currCorrectedMeCard;
    v15->_currCorrectedMeCard = 0;

    v15->_usingMyPlaces = a8;
    GEOFindOrCreateLog();
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = objc_msgSend(*p_storage, "uniqueName", v38, v39, v40, v41);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v31;
      _os_log_impl(&dword_1A70DF000, v30, OS_LOG_TYPE_DEBUG, "Using %@", (uint8_t *)&buf, 0xCu);
    }
    if (-[MapsSuggestionsShortcutManager usingMyPlaces]((BOOL)v16))
    {
      [(MapsSuggestionsMapsSync *)v16->_mapsSync addMapsSyncObserver:v16 forContentType:3];
    }
    else
    {
      [(MapsSuggestionsContacts *)v16->_contacts registerMeCardObserver:v16];
      objc_initWeak((id *)&buf, v16);
      storage = v16->_storage;
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __100__MapsSuggestionsShortcutManager_initWithStorage_suggestor_contacts_routine_mapsSync_usingMyPlaces___block_invoke;
      v43[3] = &unk_1E5CB7E78;
      objc_copyWeak(&v44, (id *)&buf);
      [(MapsSuggestionsShortcutStorage *)storage setChangeHandler:v43];
      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)&buf);
    }
    v33 = [MapsSuggestionsObservers alloc];
    v34 = v16->_queue._innerQueue;
    uint64_t v35 = [(MapsSuggestionsObservers *)v33 initWithCallbackQueue:v34 name:@"MapsSuggestionsMeCardReaderObservers" strong:0];
    meCardObservers = v16->_meCardObservers;
    v16->_meCardObservers = (MapsSuggestionsObservers *)v35;
  }
  return v16;
}

void __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (-[MapsSuggestionsShortcutManager usingMyPlaces](*(void *)(a1 + 32)))
  {
    id v4 = (void *)*((void *)v3 + 7);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_2;
    v7[3] = &unk_1E5CB8E78;
    objc_copyWeak(&v9, &location);
    id v8 = *(id *)(a1 + 40);
    [v4 shortcutsFromFavoritesWithHandler:v7];

    objc_destroyWeak(&v9);
  }
  else if (!-[MapsSuggestionsShortcutManager _loadCorrectedMeCardWithHandler:]((uint64_t)v3, *(void **)(a1 + 40)))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_3;
    v5[3] = &unk_1E5CB8368;
    id v6 = *(id *)(a1 + 40);
    dispatch_async(*((dispatch_queue_t *)v3 + 1), v5);
  }
  objc_destroyWeak(&location);
}

- (BOOL)usingMyPlaces
{
  if (result)
  {
    uint64_t v1 = result;
    if (qword_1EB6F01D0 != -1) {
      dispatch_once(&qword_1EB6F01D0, &__block_literal_global_347);
    }
    return _MergedGlobals_35 && *(unsigned char *)(v1 + 72) != 0;
  }
  return result;
}

- (char)readMeCardWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke;
    v9[3] = &unk_1E5CB8EF0;
    v9[4] = self;
    id v10 = v4;
    MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)&self->_queue, self, v9);

    char v6 = 1;
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v13 = 1024;
      int v14 = 1045;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsShortcutManager readMeCardWithHandler:]";
      __int16 v17 = 2082;
      int v18 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a callback handler", buf, 0x26u);
    }

    char v6 = 0;
  }

  return v6;
}

void __100__MapsSuggestionsShortcutManager_initWithStorage_suggestor_contacts_routine_mapsSync_usingMyPlaces___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained readMeCardWithHandler:&__block_literal_global_8];
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsShortcutManager.mm";
      __int16 v6 = 1026;
      int v7 = 147;
      __int16 v8 = 2082;
      id v9 = "-[MapsSuggestionsShortcutManager initWithStorage:suggestor:contacts:routine:mapsSync:usingMyPlaces:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void __100__MapsSuggestionsShortcutManager_initWithStorage_suggestor_contacts_routine_mapsSync_usingMyPlaces___block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  __int16 v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "Storage resulted in auto-reload: %@ / error: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)test_setUpPlaceholdersIfNeeded:(id)a3 overlays:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v29 = v6;
  v30 = v7;
  BOOL v8 = isAuthorizedToUseContacts();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  __int16 v9 = [v7 shortcutsForAll];
  char v10 = 0;
  char v11 = 0;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v9);
        }
        __int16 v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v15, "type", v29, v30) == 2) {
          char v11 = 1;
        }
        else {
          v10 |= [v15 type] == 3;
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v12);
  }
  BOOL v16 = v8;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = v29;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (!v18)
  {

    uint64_t v19 = 0;
    goto LABEL_36;
  }
  uint64_t v19 = 0;
  __int16 v20 = 0;
  uint64_t v21 = *(void *)v32;
  do
  {
    for (uint64_t j = 0; j != v18; ++j)
    {
      if (*(void *)v32 != v21) {
        objc_enumerationMutation(v17);
      }
      __int16 v23 = *(void **)(*((void *)&v31 + 1) + 8 * j);
      if (objc_msgSend(v23, "type", v29) == 2)
      {
        if (!v20)
        {
          if ([v23 isSetupPlaceholder])
          {
            __int16 v20 = v23;
LABEL_24:
            id v24 = v23;
            continue;
          }
          __int16 v20 = 0;
        }
        char v11 = 1;
      }
      else
      {
        if ([v23 type] != 3) {
          continue;
        }
        if (!v19)
        {
          if ([v23 isSetupPlaceholder])
          {
            uint64_t v19 = v23;
            goto LABEL_24;
          }
          uint64_t v19 = 0;
        }
        char v10 = 1;
      }
    }
    uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v41 count:16];
  }
  while (v18);

  if (v20)
  {
    if (v19) {
      goto LABEL_33;
    }
LABEL_37:
    uint64_t v19 = MapsSuggestionsSetupShortcutForType(3);
    if (v11) {
      goto LABEL_38;
    }
    goto LABEL_39;
  }
LABEL_36:
  __int16 v20 = MapsSuggestionsSetupShortcutForType(2);
  if (!v19) {
    goto LABEL_37;
  }
LABEL_33:
  if (v11) {
LABEL_38:
  }
    objc_msgSend(v20, "setIsHidden:", 1, v29);
LABEL_39:
  if (v10) {
    [v19 setIsHidden:1];
  }
  if (!v16)
  {
    if (GEOConfigGetInteger() == 1)
    {
      [v20 setIsHidden:1];
      [v19 setIsHidden:1];
    }
    if (GEOConfigGetInteger() == 2)
    {
      [v20 setIsHidden:0];
      [v19 setIsHidden:0];
    }
  }
  GEOFindOrCreateLog();
  uint64_t v25 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v40[0] = v20;
    v40[1] = v19;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v26;
    _os_log_impl(&dword_1A70DF000, v25, OS_LOG_TYPE_DEBUG, "Placeholders: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = v20;
  *((void *)&buf + 1) = v19;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:2];

  return v27;
}

- (void)test_sortMapsSuggestionsShortcuts:(id)a3
{
}

void __73__MapsSuggestionsShortcutManager__mergeShortcuts_toMeCardAndCallHandler___block_invoke(id *a1, char a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-17 reason:@"Could not write to Storage!"];
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v12 = v3;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "Error during addOrUpdateShortcuts: %@", buf, 0xCu);
    }
  }
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__MapsSuggestionsShortcutManager__mergeShortcuts_toMeCardAndCallHandler___block_invoke_171;
    v7[3] = &unk_1E5CB8D60;
    BOOL v8 = a1[4];
    id v10 = a1[5];
    __int16 v9 = v3;
    MSg::Queue::async<MapsSuggestionsShortcutManager>(WeakRetained + 1, WeakRetained, v7);

    id v6 = v8;
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      uint64_t v12 = "MapsSuggestionsShortcutManager.mm";
      __int16 v13 = 1026;
      int v14 = 419;
      __int16 v15 = 2082;
      BOOL v16 = "-[MapsSuggestionsShortcutManager _mergeShortcuts:toMeCardAndCallHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelfUpdate went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __73__MapsSuggestionsShortcutManager__mergeShortcuts_toMeCardAndCallHandler___block_invoke_171(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)[v3[12] copy];
  id v5 = (void *)[v3[8] mutableCopy];
  [v5 addObjectsFromArray:*(void *)(a1 + 32)];
  id v6 = [MapsSuggestionsMeCard alloc];
  id v7 = [v3[10] shortcutsPerCNPostalAddress];
  uint64_t v8 = -[MapsSuggestionsMeCard initWithShortcuts:perCNPostalAddress:hasCorrected:hasGeocoded:](v6, "initWithShortcuts:perCNPostalAddress:hasCorrected:hasGeocoded:", v5, v7, [*(id *)(a1 + 32) count] != 0, objc_msgSend(v3[10], "hasGeocoded"));
  id v9 = v3[12];
  v3[12] = (id)v8;

  id v10 = (void *)[v3[12] copy];
  char v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v18 = v10;
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "Calling handler with merged Shortcuts: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (([v10 isEqualToMeCard:v4] & 1) == 0)
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "New MeCard detected: %@", buf, 0xCu);
    }

    id v13 = v3[11];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__MapsSuggestionsShortcutManager__mergeShortcuts_toMeCardAndCallHandler___block_invoke_173;
    v14[3] = &unk_1E5CB82B0;
    __int16 v15 = v3;
    id v16 = v10;
    [v13 callBlock:v14];
  }
}

void __73__MapsSuggestionsShortcutManager__mergeShortcuts_toMeCardAndCallHandler___block_invoke_173(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  GEOFindOrCreateLog();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [v3 uniqueName];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Calling observer '%@'", (uint8_t *)&v6, 0xCu);
  }
  [v3 meCardReader:*(void *)(a1 + 32) didUpdateMeCard:*(void *)(a1 + 40)];
}

void __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      __int16 v20 = v7;
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "Error loading from MeCard: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_177;
    v17[3] = &unk_1E5CB8DB0;
    uint64_t v18 = v5;
    MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)(a1 + 56), v8, v17);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v10 = WeakRetained;
    if (WeakRetained)
    {
      char v11 = (void *)*((void *)WeakRetained + 3);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_178;
      v14[3] = &unk_1E5CB8E00;
      __int16 v15 = *(id *)(a1 + 40);
      objc_copyWeak(&v16, (id *)(a1 + 48));
      [v11 loadAllShortcutsWithHandler:v14];
      objc_destroyWeak(&v16);
      uint64_t v12 = v15;
    }
    else
    {
      GEOFindOrCreateLog();
      uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136446722;
        __int16 v20 = "MapsSuggestionsShortcutManager.mm";
        __int16 v21 = 1026;
        int v22 = 478;
        __int16 v23 = 2082;
        id v24 = "-[MapsSuggestionsShortcutManager __loadCorrectedMeCardWithHandler:]_block_invoke_2";
        _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfMeCard went away in %{public}s", buf, 0x1Cu);
      }
    }
    id v13 = v18;
  }
}

void __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_177(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  id v4 = (void *)v5[10];
  v5[10] = v3;
}

void __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v7;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "Error loading from Storage (MapsSync): %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v5;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Loaded Shortcuts from storage: %@", buf, 0xCu);
    }

    id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_179;
      block[3] = &unk_1E5CB8720;
      objc_copyWeak(&v15, (id *)(a1 + 40));
      id v13 = v5;
      id v14 = *(id *)(a1 + 32);
      dispatch_async(WeakRetained[1], block);

      objc_destroyWeak(&v15);
    }
    else
    {
      GEOFindOrCreateLog();
      char v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136446722;
        uint64_t v17 = "MapsSuggestionsShortcutManager.mm";
        __int16 v18 = 1026;
        int v19 = 492;
        __int16 v20 = 2082;
        __int16 v21 = "-[MapsSuggestionsShortcutManager __loadCorrectedMeCardWithHandler:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfLoadStorage went away in %{public}s", buf, 0x1Cu);
      }
    }
  }
}

void __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_179(uint64_t a1)
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  val = WeakRetained;
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      v136 = "MapsSuggestionsShortcutManager.mm";
      __int16 v137 = 1026;
      int v138 = 503;
      __int16 v139 = 2082;
      v140 = "-[MapsSuggestionsShortcutManager __loadCorrectedMeCardWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfMerge went away in %{public}s", buf, 0x1Cu);
    }

    goto LABEL_158;
  }
  uint64_t v3 = WeakRetained;
  id v4 = *(void **)(a1 + 32);
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_180;
  v106[3] = &unk_1E5CB8DD8;
  v106[4] = v3;
  id v5 = objc_msgSend(v4, "MSg_copyIf:", v106);
  int v6 = *(void **)(a1 + 40);
  id v90 = v5;
  id v88 = v6;
  if (!v88)
  {
    uint64_t v25 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446978;
      v136 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v137 = 1024;
      int v138 = 320;
      __int16 v139 = 2082;
      v140 = "-[MapsSuggestionsShortcutManager _mergeShortcuts:toMeCardAndCallHandler:]";
      __int16 v141 = 2082;
      v142 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v25, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    goto LABEL_157;
  }
  id v7 = val[1];
  dispatch_assert_queue_V2(v7);

  objc_initWeak(&location, val);
  id v8 = val[10];
  id v105 = v90;
  BOOL v9 = isAuthorizedToUseContacts();
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v10 = [v8 shortcutsForAll];
  char v11 = 0;
  char v12 = 0;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v126 objects:buf count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v127;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v127 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v126 + 1) + 8 * i);
        if ([v16 type] == 2) {
          char v12 = 1;
        }
        else {
          v11 |= [v16 type] == 3;
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v126 objects:buf count:16];
    }
    while (v13);
  }

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  obuint64_t j = v105;
  uint64_t v17 = [obj countByEnumeratingWithState:&v122 objects:v130 count:16];
  if (!v17)
  {

    __int16 v18 = 0;
    goto LABEL_44;
  }
  __int16 v18 = 0;
  int v19 = 0;
  uint64_t v20 = *(void *)v123;
  do
  {
    for (uint64_t j = 0; j != v17; ++j)
    {
      if (*(void *)v123 != v20) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void **)(*((void *)&v122 + 1) + 8 * j);
      if ([v22 type] == 2)
      {
        if (!v19)
        {
          if ([v22 isSetupPlaceholder])
          {
            int v19 = v22;
LABEL_26:
            id v23 = v22;
            continue;
          }
          int v19 = 0;
        }
        char v12 = 1;
      }
      else
      {
        if ([v22 type] != 3) {
          continue;
        }
        if (!v18)
        {
          if ([v22 isSetupPlaceholder])
          {
            __int16 v18 = v22;
            goto LABEL_26;
          }
          __int16 v18 = 0;
        }
        char v11 = 1;
      }
    }
    uint64_t v17 = [obj countByEnumeratingWithState:&v122 objects:v130 count:16];
  }
  while (v17);

  if (v19)
  {
    if (v18) {
      goto LABEL_35;
    }
LABEL_45:
    __int16 v18 = MapsSuggestionsSetupShortcutForType(3);
    if (v12) {
      goto LABEL_46;
    }
    goto LABEL_47;
  }
LABEL_44:
  int v19 = MapsSuggestionsSetupShortcutForType(2);
  if (!v18) {
    goto LABEL_45;
  }
LABEL_35:
  if (v12) {
LABEL_46:
  }
    [v19 setIsHidden:1];
LABEL_47:
  if (v11) {
    [v18 setIsHidden:1];
  }
  if (!v9)
  {
    if (GEOConfigGetInteger() == 1)
    {
      [v19 setIsHidden:1];
      [v18 setIsHidden:1];
    }
    if (GEOConfigGetInteger() == 2)
    {
      [v19 setIsHidden:0];
      [v18 setIsHidden:0];
    }
  }
  GEOFindOrCreateLog();
  uint64_t v26 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(void *)&long long v143 = v19;
    *((void *)&v143 + 1) = v18;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v143 count:2];
    LODWORD(v131) = 138412290;
    *(void *)((char *)&v131 + 4) = v27;
    _os_log_impl(&dword_1A70DF000, v26, OS_LOG_TYPE_DEBUG, "Placeholders: %@", (uint8_t *)&v131, 0xCu);
  }
  *(void *)&long long v131 = v19;
  *((void *)&v131 + 1) = v18;
  v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:2];

  v89 = [val[10] shortcutsForAll];
  uint64_t v28 = [v87 count];
  uint64_t v29 = [v89 count];
  uint64_t v30 = [obj count];
  v96 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v29 + v28 + v30];
  v97 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v89, "count"));
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v93 = v87;
  uint64_t v31 = [v93 countByEnumeratingWithState:&v111 objects:&v126 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v112;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v112 != v32) {
          objc_enumerationMutation(v93);
        }
        long long v34 = *(void **)(*((void *)&v111 + 1) + 8 * k);
        if (([v34 isHidden] & 1) == 0) {
          [v96 addObject:v34];
        }
      }
      uint64_t v31 = [v93 countByEnumeratingWithState:&v111 objects:&v126 count:16];
    }
    while (v31);
  }

  [val[8] removeAllObjects];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v92 = v89;
  uint64_t v95 = [v92 countByEnumeratingWithState:&v107 objects:&v122 count:16];
  if (v95)
  {
    uint64_t v94 = *(void *)v108;
    do
    {
      for (uint64_t m = 0; m != v95; ++m)
      {
        if (*(void *)v108 != v94) {
          objc_enumerationMutation(v92);
        }
        id v35 = *(id *)(*((void *)&v107 + 1) + 8 * m);
        id v36 = obj;
        long long v143 = 0u;
        long long v144 = 0u;
        long long v145 = 0u;
        long long v146 = 0u;
        id v100 = v36;
        uint64_t v37 = [v100 countByEnumeratingWithState:&v143 objects:buf count:16];
        if (v37)
        {
          uint64_t v101 = *(void *)v144;
          while (2)
          {
            for (uint64_t n = 0; n != v37; ++n)
            {
              if (*(void *)v144 != v101) {
                objc_enumerationMutation(v100);
              }
              id v39 = *(void **)(*((void *)&v143 + 1) + 8 * n);
              id v40 = [v39 originatingAddressString];
              id v41 = v105;
              if (v40)
              {
                id v103 = [v39 originatingAddressString];
                id v41 = [v35 originatingAddressString];
                if ([v103 isEqualToString:v41])
                {

LABEL_90:
                  uint64_t v47 = [v39 identifier];
                  [v35 setIdentifier:v47];

                  v48 = [v39 customName];
                  [v35 setCustomName:v48];

                  v49 = [v39 geoMapItem];
                  [v35 setGeoMapItem:v49];

                  objc_msgSend(v35, "setIsHidden:", objc_msgSend(v39, "isHidden"));
                  long long v133 = 0u;
                  long long v134 = 0u;
                  long long v131 = 0u;
                  long long v132 = 0u;
                  v50 = [v39 contacts];
                  uint64_t v51 = [v50 countByEnumeratingWithState:&v131 objects:v130 count:16];
                  if (v51)
                  {
                    uint64_t v52 = *(void *)v132;
                    do
                    {
                      for (iuint64_t i = 0; ii != v51; ++ii)
                      {
                        if (*(void *)v132 != v52) {
                          objc_enumerationMutation(v50);
                        }
                        [v35 addContact:*(void *)(*((void *)&v131 + 1) + 8 * ii)];
                      }
                      uint64_t v51 = [v50 countByEnumeratingWithState:&v131 objects:v130 count:16];
                    }
                    while (v51);
                  }

                  goto LABEL_98;
                }
              }
              id v42 = [v39 identifier];
              id v105 = v41;
              if (v42)
              {
                uint64_t v43 = [v39 identifier];
                id v44 = [v35 identifier];
                int v45 = [v43 isEqualToString:v44];

                if (v40)
                {

                  if (v45) {
                    goto LABEL_90;
                  }
                }
                else if (v45)
                {
                  goto LABEL_90;
                }
              }
              else if (v40)
              {
              }
            }
            uint64_t v37 = [v100 countByEnumeratingWithState:&v143 objects:buf count:16];
            if (v37) {
              continue;
            }
            break;
          }
        }

        [v35 setDerivedFromMeCard:1];
        GEOFindOrCreateLog();
        v46 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          v136 = (char *)v35;
          _os_log_impl(&dword_1A70DF000, v46, OS_LOG_TYPE_DEBUG, "Found a brand new Shortcut in the raw MeCard: %@", buf, 0xCu);
        }

LABEL_98:
        v54 = [v35 identifier];
        if (v54)
        {
          if (([v97 containsObject:v54] & 1) == 0)
          {
            [v97 addObject:v54];
            int v55 = [v35 isHidden];
            id v56 = v96;
            if (v55) {
              id v56 = val[8];
            }
            [v56 addObject:v35];
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v57 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            v136 = (char *)v35;
            _os_log_impl(&dword_1A70DF000, v57, OS_LOG_TYPE_DEBUG, "Found Shortcut in MeCard without identifier: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v95 = [v92 countByEnumeratingWithState:&v107 objects:&v122 count:16];
    }
    while (v95);
  }

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v58 = obj;
  uint64_t v59 = [v58 countByEnumeratingWithState:&v131 objects:v130 count:16];
  if (v59)
  {
    uint64_t v60 = *(void *)v132;
    do
    {
      for (juint64_t j = 0; jj != v59; ++jj)
      {
        if (*(void *)v132 != v60) {
          objc_enumerationMutation(v58);
        }
        v62 = *(void **)(*((void *)&v131 + 1) + 8 * jj);
        v63 = [v62 identifier];
        if (v63)
        {
          if (([v97 containsObject:v63] & 1) == 0
            && ([v62 isSetupPlaceholder] & 1) == 0)
          {
            [v97 addObject:v63];
            if (([v62 isHidden] & 1) == 0) {
              [v96 addObject:v62];
            }
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v64 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            v136 = (char *)v62;
            _os_log_impl(&dword_1A70DF000, v64, OS_LOG_TYPE_DEBUG, "Found Shortcut in storage without identifier: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v59 = [v58 countByEnumeratingWithState:&v131 objects:v130 count:16];
    }
    while (v59);
  }

  id v102 = v96;
  v65 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v102, "count"));
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v104 = v102;
  uint64_t v66 = [v104 countByEnumeratingWithState:&v143 objects:buf count:16];
  if (v66)
  {
    uint64_t v67 = *(void *)v144;
    do
    {
      for (kuint64_t k = 0; kk != v66; ++kk)
      {
        if (*(void *)v144 != v67) {
          objc_enumerationMutation(v104);
        }
        v69 = (void *)[*(id *)(*((void *)&v143 + 1) + 8 * kk) copy];
        v70 = [v69 identifier];
        if (!v70)
        {
          if ([v69 isBackedPlaceholder])
          {
            v70 = 0;
          }
          else
          {
            if ([v69 isSetupPlaceholder]) {
              goto LABEL_136;
            }
            id v71 = objc_alloc_init(MEMORY[0x1E4F29128]);
            v72 = [v71 UUIDString];
            [v69 setIdentifier:v72];

            GEOFindOrCreateLog();
            v70 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v116) = 138412290;
              *(void *)((char *)&v116 + 4) = v69;
              _os_log_impl(&dword_1A70DF000, v70, OS_LOG_TYPE_DEBUG, "Set fake identifier on Shortcut: %@", (uint8_t *)&v116, 0xCu);
            }
          }
        }

LABEL_136:
        GEOFindOrCreateLog();
        v73 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(v116) = 138412290;
          *(void *)((char *)&v116 + 4) = v69;
          _os_log_impl(&dword_1A70DF000, v73, OS_LOG_TYPE_DEBUG, "Will store Shortcut: %@", (uint8_t *)&v116, 0xCu);
        }

        [v65 addObject:v69];
      }
      uint64_t v66 = [v104 countByEnumeratingWithState:&v143 objects:buf count:16];
    }
    while (v66);
  }

  v74 = (char *)[v65 copy];
  GEOFindOrCreateLog();
  v75 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    v136 = v74;
    _os_log_impl(&dword_1A70DF000, v75, OS_LOG_TYPE_DEBUG, "Shortcuts to store (unclean): %@", buf, 0xCu);
  }

  v76 = v74;
  v77 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v76, "count"));
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  v78 = v76;
  uint64_t v79 = [v78 countByEnumeratingWithState:&v143 objects:buf count:16];
  if (v79)
  {
    uint64_t v80 = *(void *)v144;
    do
    {
      for (uint64_t mm = 0; mm != v79; ++mm)
      {
        if (*(void *)v144 != v80) {
          objc_enumerationMutation(v78);
        }
        v82 = *(void **)(*((void *)&v143 + 1) + 8 * mm);
        if (([v58 containsObject:v82] & 1) == 0 && (objc_msgSend(v82, "isSetupPlaceholder") & 1) == 0) {
          [v77 addObject:v82];
        }
      }
      uint64_t v79 = [v78 countByEnumeratingWithState:&v143 objects:buf count:16];
    }
    while (v79);
  }

  GEOFindOrCreateLog();
  v83 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v116) = 138412290;
    *(void *)((char *)&v116 + 4) = v104;
    _os_log_impl(&dword_1A70DF000, v83, OS_LOG_TYPE_DEBUG, "All known Shortcuts: %@", (uint8_t *)&v116, 0xCu);
  }

  GEOFindOrCreateLog();
  v84 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v116) = 138412290;
    *(void *)((char *)&v116 + 4) = v78;
    _os_log_impl(&dword_1A70DF000, v84, OS_LOG_TYPE_DEBUG, "Storing changed Shortcuts: %@", (uint8_t *)&v116, 0xCu);
  }

  id v85 = val[3];
  *(void *)&long long v116 = MEMORY[0x1E4F143A8];
  *((void *)&v116 + 1) = 3221225472;
  v117 = __73__MapsSuggestionsShortcutManager__mergeShortcuts_toMeCardAndCallHandler___block_invoke;
  v118 = &unk_1E5CB8D88;
  objc_copyWeak(v121, &location);
  id v86 = v104;
  id v119 = v86;
  id v120 = v88;
  [v85 addOrUpdateShortcuts:v77 handler:&v116];

  objc_destroyWeak(v121);
  objc_destroyWeak(&location);
LABEL_157:

LABEL_158:
}

uint64_t __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke_180(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = 0;
  switch([v3 type])
  {
    case 1:
    case 6:
      uint64_t v4 = 1;
      break;
    case 2:
      id v5 = *(void **)(*(void *)(a1 + 32) + 104);
      int v6 = [v3 originatingAddressString];
      if ([v5 containsObject:v6]) {
        goto LABEL_8;
      }
      goto LABEL_9;
    case 3:
      id v7 = *(void **)(*(void *)(a1 + 32) + 112);
      int v6 = [v3 originatingAddressString];
      if (([v7 containsObject:v6] & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    case 5:
      id v8 = *(void **)(*(void *)(a1 + 32) + 120);
      int v6 = [v3 originatingAddressString];
      if ([v8 containsObject:v6]) {
LABEL_8:
      }
        uint64_t v4 = 1;
      else {
LABEL_9:
      }
        uint64_t v4 = [v3 isSetupPlaceholder];

      break;
    default:
      break;
  }

  return v4;
}

- (uint64_t)_loadCorrectedMeCardWithHandler:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!a1)
  {
LABEL_7:
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  if (!v3)
  {
    char v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v19 = 1024;
      int v20 = 533;
      __int16 v21 = 2082;
      uint64_t v22 = "-[MapsSuggestionsShortcutManager _loadCorrectedMeCardWithHandler:]";
      __int16 v23 = 2082;
      id v24 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }

    goto LABEL_7;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  objc_initWeak((id *)location, (id)a1);
  id v5 = *(id *)(a1 + 8);
  id v6 = *(id *)(a1 + 16);
  id v7 = *(void **)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3321888768;
  v13[2] = __66__MapsSuggestionsShortcutManager__loadCorrectedMeCardWithHandler___block_invoke;
  v13[3] = &unk_1EFC5DC48;
  id v8 = v5;
  id v16 = v8;
  id v9 = v6;
  id v17 = v9;
  objc_copyWeak(&v15, (id *)location);
  id v14 = v4;
  uint64_t v10 = [v7 readMeCardAddressStringsWithHandler:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)location);
LABEL_8:

  return v10;
}

void __66__MapsSuggestionsShortcutManager__loadCorrectedMeCardWithHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    uint64_t v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v25 = v12;
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "Error reading raw address strings: %@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MapsSuggestionsShortcutManager__loadCorrectedMeCardWithHandler___block_invoke_183;
  block[3] = &unk_1E5CB8E28;
  objc_copyWeak(&v23, (id *)(a1 + 40));
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = *(id *)(a1 + 32);
  id v14 = *(NSObject **)(a1 + 48);
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(v14, block);

  objc_destroyWeak(&v23);
}

void __66__MapsSuggestionsShortcutManager__loadCorrectedMeCardWithHandler___block_invoke_183(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    uint64_t v3 = [a1[4] copy];
    uint64_t v4 = (void *)*((void *)WeakRetained + 13);
    *((void *)WeakRetained + 13) = v3;

    uint64_t v5 = [a1[5] copy];
    id v6 = (void *)*((void *)WeakRetained + 14);
    *((void *)WeakRetained + 14) = v5;

    uint64_t v7 = [a1[6] copy];
    id v8 = (void *)*((void *)WeakRetained + 15);
    *((void *)WeakRetained + 15) = v7;

    id v9 = a1[7];
    if (v9)
    {
      dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
      objc_initWeak(&location, WeakRetained);
      id v10 = *((id *)WeakRetained + 1);
      id v11 = *((id *)WeakRetained + 2);
      id v12 = (void *)*((void *)WeakRetained + 6);
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3321888768;
      *(void *)&buf[16] = __67__MapsSuggestionsShortcutManager___loadCorrectedMeCardWithHandler___block_invoke;
      *(void *)&buf[24] = &unk_1EFC5DC10;
      id v13 = v10;
      id v21 = v13;
      id v14 = v11;
      id v22 = v14;
      *(void *)&buf[32] = WeakRetained;
      objc_copyWeak(&v20, &location);
      id v19 = v9;
      [v12 readMeCardWithHandler:buf];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    else
    {
      id v16 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136446978;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 453;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "-[MapsSuggestionsShortcutManager __loadCorrectedMeCardWithHandler:]";
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = "nil == (handler)";
        _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsShortcutManager.mm";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 551;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsShortcutManager _loadCorrectedMeCardWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (char)loadAllShortcutsWithHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke;
    v9[3] = &unk_1E5CB8EF0;
    v9[4] = self;
    id v10 = v4;
    MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)&self->_queue, self, v9);

    char v6 = 1;
  }
  else
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446978;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v13 = 1024;
      int v14 = 563;
      __int16 v15 = 2082;
      id v16 = "-[MapsSuggestionsShortcutManager loadAllShortcutsWithHandler:]";
      __int16 v17 = 2082;
      __int16 v18 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    char v6 = 0;
  }

  return v6;
}

void __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Loading Shortcuts", buf, 2u);
  }

  if (-[MapsSuggestionsShortcutManager usingMyPlaces](*(void *)(a1 + 32)))
  {
    uint64_t v5 = (void *)v3[7];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_186;
    v19[3] = &unk_1E5CB8E78;
    char v6 = &v21;
    objc_copyWeak(&v21, &location);
    id v20 = *(id *)(a1 + 40);
    uint64_t v7 = &v20;
    if (![v5 shortcutsFromFavoritesWithHandler:v19])
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MapsSuggestionError" code:-1 userInfo:&unk_1EFC89E68];
      id v9 = (id *)v18;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_2;
      v18[3] = &unk_1E5CB8EA0;
      id v10 = *(id *)(a1 + 40);
      v18[4] = v8;
      v18[5] = v10;
LABEL_8:
      id v12 = v3[1];
      id v13 = v8;
      dispatch_async(v12, v9);
    }
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_3;
    v15[3] = &unk_1E5CB8EC8;
    char v6 = &v17;
    objc_copyWeak(&v17, &location);
    id v16 = *(id *)(a1 + 40);
    uint64_t v7 = &v16;
    if (!-[MapsSuggestionsShortcutManager _loadCorrectedMeCardWithHandler:]((uint64_t)v3, v15))
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MapsSuggestionError" code:-1 userInfo:&unk_1EFC89E90];
      id v9 = (id *)v14;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_2_206;
      v14[3] = &unk_1E5CB8EA0;
      id v11 = *(id *)(a1 + 40);
      void v14[4] = v8;
      v14[5] = v11;
      goto LABEL_8;
    }
  }

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v17[13] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      __int16 v15 = v5;
      __int16 v16 = 2112;
      *(void *)id v17 = v6;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Loaded new Shortcuts: %@ (%@)", buf, 0x16u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_187;
    block[3] = &unk_1E5CB8E50;
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    dispatch_async(WeakRetained[1], block);

    id v9 = v13;
  }
  else
  {
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      __int16 v15 = "MapsSuggestionsShortcutManager.mm";
      __int16 v16 = 1026;
      *(_DWORD *)id v17 = 569;
      v17[2] = 2082;
      *(void *)&v17[3] = "-[MapsSuggestionsShortcutManager loadAllShortcutsWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
  }
}

uint64_t __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_187(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

void __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v18[13] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [v5 shortcutsForAll];
      *(_DWORD *)long long buf = 138412546;
      __int16 v16 = v9;
      __int16 v17 = 2112;
      *(void *)__int16 v18 = v6;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Loaded Shortcuts: %@ (%@)", buf, 0x16u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_198;
    block[3] = &unk_1E5CB8E50;
    int v14 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(WeakRetained[1], block);

    id v10 = v14;
  }
  else
  {
    GEOFindOrCreateLog();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      __int16 v16 = "MapsSuggestionsShortcutManager.mm";
      __int16 v17 = 1026;
      *(_DWORD *)__int16 v18 = 583;
      v18[2] = 2082;
      *(void *)&v18[3] = "-[MapsSuggestionsShortcutManager loadAllShortcutsWithHandler:]_block_invoke_3";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_198(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) shortcutsForAll];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

uint64_t __62__MapsSuggestionsShortcutManager_loadAllShortcutsWithHandler___block_invoke_2_206(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

- (char)addOrUpdateShortcuts:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = a4;
  if (!v7)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446978;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v19 = 1024;
      int v20 = 604;
      __int16 v21 = 2082;
      id v22 = "-[MapsSuggestionsShortcutManager addOrUpdateShortcuts:handler:]";
      __int16 v23 = 2082;
      id v24 = "nil == (handler)";
      id v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x26u);
    }
LABEL_11:
    char v11 = 0;
    goto LABEL_12;
  }
  if (!v6)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446978;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v19 = 1024;
      int v20 = 605;
      __int16 v21 = 2082;
      id v22 = "-[MapsSuggestionsShortcutManager addOrUpdateShortcuts:handler:]";
      __int16 v23 = 2082;
      id v24 = "nil == (shortcuts)";
      id v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    __int16 v18 = v6;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Storing Shortcuts: %@", buf, 0xCu);
  }

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6 copyItems:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__MapsSuggestionsShortcutManager_addOrUpdateShortcuts_handler___block_invoke;
  v14[3] = &unk_1E5CB8EF0;
  id v15 = v9;
  id v16 = v7;
  id v10 = v9;
  MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)&self->_queue, self, v14);

  char v11 = 1;
LABEL_12:

  return v11;
}

void __63__MapsSuggestionsShortcutManager_addOrUpdateShortcuts_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = a1;
  __int16 v17 = a2;
  id v2 = *(id *)(v16 + 32);
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v7), "copy", v16);
        id v9 = [v8 identifier];
        if (v9) {
          goto LABEL_9;
        }
        if ([v8 isBackedPlaceholder])
        {
          id v9 = 0;
LABEL_9:

          goto LABEL_10;
        }
        if (([v8 isSetupPlaceholder] & 1) == 0)
        {
          id v11 = objc_alloc_init(MEMORY[0x1E4F29128]);
          id v12 = [v11 UUIDString];
          [v8 setIdentifier:v12];

          id v9 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            __int16 v23 = v8;
            _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "Set fake identifier on Shortcut: %@", buf, 0xCu);
          }
          goto LABEL_9;
        }
LABEL_10:
        id v10 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          __int16 v23 = v8;
          _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "Will store Shortcut: %@", buf, 0xCu);
        }

        [v8 setDerivedFromMeCard:0];
        [v3 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v13 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
      uint64_t v5 = v13;
    }
    while (v13);
  }

  int v14 = (void *)[v3 copy];
  id v15 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v24 = 138412290;
    uint64_t v25 = v14;
    _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "Shortcuts to store (cleaned): %@", v24, 0xCu);
  }

  [v17[3] addOrUpdateShortcuts:v14 handler:*(void *)(v16 + 40)];
}

- (char)removeShortcuts:(id)a3 handler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446978;
      long long v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 625;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager removeShortcuts:handler:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (handler)";
      id v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x26u);
    }
LABEL_9:
    char v11 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446978;
      long long v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 626;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager removeShortcuts:handler:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (shortcuts)";
      id v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v8 = self->_storage;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MapsSuggestionsShortcutManager_removeShortcuts_handler___block_invoke;
  block[3] = &unk_1E5CB8458;
  id v15 = v6;
  uint64_t v16 = v8;
  id v17 = v7;
  innerQueue = self->_queue._innerQueue;
  id v10 = v8;
  dispatch_async(innerQueue, block);

  char v11 = 1;
LABEL_10:

  return v11;
}

void __58__MapsSuggestionsShortcutManager_removeShortcuts_handler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v12 = a1;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v9 = [v8 type];
        if (v9 <= 6)
        {
          if (((1 << v9) & 0x2C) != 0)
          {
            [v8 setIsHidden:1];
            char v11 = v2;
LABEL_11:
            [v11 addObject:v8];
            continue;
          }
          uint64_t v10 = 1 << v9;
          char v11 = v3;
          if ((v10 & 0x43) != 0) {
            goto LABEL_11;
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  if ([v2 count]) {
    [*(id *)(v12 + 40) addOrUpdateShortcuts:v2 handler:*(void *)(v12 + 48)];
  }
  if ([v3 count]) {
    [*(id *)(v12 + 40) removeShortcuts:v3 handler:*(void *)(v12 + 48)];
  }
}

- (char)moveShortcut:(id)a3 toIndex:(int64_t)a4 withSnapshot:(id)a5 handler:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v12)
  {
    long long v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446978;
      uint64_t v43 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v44 = 1024;
      int v45 = 665;
      __int16 v46 = 2082;
      uint64_t v47 = "-[MapsSuggestionsShortcutManager moveShortcut:toIndex:withSnapshot:handler:]";
      __int16 v48 = 2082;
      v49 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_16;
  }
  if (!v10)
  {
    long long v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446978;
      uint64_t v43 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v44 = 1024;
      int v45 = 666;
      __int16 v46 = 2082;
      uint64_t v47 = "-[MapsSuggestionsShortcutManager moveShortcut:toIndex:withSnapshot:handler:]";
      __int16 v48 = 2082;
      v49 = "nil == (shortcut)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", buf, 0x26u);
    }
    goto LABEL_16;
  }
  if (a4 < 0)
  {
    long long v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446978;
      uint64_t v43 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v44 = 1024;
      int v45 = 667;
      __int16 v46 = 2082;
      uint64_t v47 = "-[MapsSuggestionsShortcutManager moveShortcut:toIndex:withSnapshot:handler:]";
      __int16 v48 = 2082;
      v49 = "index < 0";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires index >= 0", buf, 0x26u);
    }
LABEL_16:

    char v17 = 0;
    goto LABEL_31;
  }
  for (unint64_t i = 0; i < [v11 count]; ++i)
  {
    long long v14 = [v11 objectAtIndexedSubscript:i];
    char v15 = [v14 isEqualToShortcut:v10];

    if (v15) {
      goto LABEL_18;
    }
  }
  unint64_t i = -1;
LABEL_18:
  if (i == a4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke;
    block[3] = &unk_1E5CB8368;
    id v41 = v12;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);
  }
  else if (i >= [v11 count])
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_2;
    v38[3] = &unk_1E5CB8368;
    id v39 = v12;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v38);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    if (a4 <= 0)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_3;
      v34[3] = &unk_1E5CB8720;
      objc_copyWeak(&v37, (id *)buf);
      id v35 = v10;
      id v36 = v12;
      dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v34);

      objc_destroyWeak(&v37);
    }
    else
    {
      uint64_t v18 = [v11 objectAtIndex:a4 - (i >= a4)];
      unint64_t v19 = [v18 type];
      if (v19 <= 5 && ((1 << v19) & 0x2C) != 0)
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_211;
        v30[3] = &unk_1E5CB8720;
        __int16 v20 = &v33;
        objc_copyWeak(&v33, (id *)buf);
        p_queue = &self->_queue;
        __int16 v22 = &v31;
        id v31 = v10;
        __int16 v23 = &v32;
        id v32 = v12;
        dispatch_async((dispatch_queue_t)p_queue->_innerQueue, v30);
      }
      else
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_212;
        v25[3] = &unk_1E5CB8798;
        __int16 v20 = &v29;
        objc_copyWeak(&v29, (id *)buf);
        id v26 = v10;
        id v27 = v18;
        id v28 = v12;
        dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v25);

        __int16 v22 = &v26;
        __int16 v23 = &v27;
      }

      objc_destroyWeak(v20);
    }
    objc_destroyWeak((id *)buf);
  }
  char v17 = 1;
LABEL_31:

  return v17;
}

uint64_t __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] moveShortcutToFront:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      uint64_t v6 = "MapsSuggestionsShortcutManager.mm";
      __int16 v7 = 1026;
      int v8 = 700;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsShortcutManager moveShortcut:toIndex:withSnapshot:handler:]_block_invoke_3";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_211(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] moveShortcutToFront:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      uint64_t v6 = "MapsSuggestionsShortcutManager.mm";
      __int16 v7 = 1026;
      int v8 = 719;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsShortcutManager moveShortcut:toIndex:withSnapshot:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void __76__MapsSuggestionsShortcutManager_moveShortcut_toIndex_withSnapshot_handler___block_invoke_212(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] moveShortcut:*(void *)(a1 + 32) afterShortcut:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      uint64_t v6 = "MapsSuggestionsShortcutManager.mm";
      __int16 v7 = 1026;
      int v8 = 727;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsShortcutManager moveShortcut:toIndex:withSnapshot:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (char)moveShortcut:(id)a3 beforeShortcut:(id)a4 handler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 737;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager moveShortcut:beforeShortcut:handler:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v8)
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 738;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager moveShortcut:beforeShortcut:handler:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (shortcut)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", location, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v9)
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 739;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager moveShortcut:beforeShortcut:handler:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (other)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", location, 0x26u);
    }
LABEL_13:

    char v11 = 0;
    goto LABEL_14;
  }
  objc_initWeak((id *)location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__MapsSuggestionsShortcutManager_moveShortcut_beforeShortcut_handler___block_invoke;
  v14[3] = &unk_1E5CB8798;
  objc_copyWeak(&v18, (id *)location);
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)location);
  char v11 = 1;
LABEL_14:

  return v11;
}

void __70__MapsSuggestionsShortcutManager_moveShortcut_beforeShortcut_handler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] moveShortcut:*(void *)(a1 + 32) beforeShortcut:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      uint64_t v6 = "MapsSuggestionsShortcutManager.mm";
      __int16 v7 = 1026;
      int v8 = 745;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsShortcutManager moveShortcut:beforeShortcut:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (char)moveShortcut:(id)a3 afterShortcut:(id)a4 handler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 757;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager moveShortcut:afterShortcut:handler:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v8)
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 758;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager moveShortcut:afterShortcut:handler:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (shortcut)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", location, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v9)
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 759;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager moveShortcut:afterShortcut:handler:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (other)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", location, 0x26u);
    }
LABEL_13:

    char v11 = 0;
    goto LABEL_14;
  }
  objc_initWeak((id *)location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__MapsSuggestionsShortcutManager_moveShortcut_afterShortcut_handler___block_invoke;
  v14[3] = &unk_1E5CB8798;
  objc_copyWeak(&v18, (id *)location);
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)location);
  char v11 = 1;
LABEL_14:

  return v11;
}

void __69__MapsSuggestionsShortcutManager_moveShortcut_afterShortcut_handler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] moveShortcut:*(void *)(a1 + 32) afterShortcut:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      uint64_t v6 = "MapsSuggestionsShortcutManager.mm";
      __int16 v7 = 1026;
      int v8 = 765;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsShortcutManager moveShortcut:afterShortcut:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (char)moveShortcutToFront:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    __int16 v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v16 = 1024;
      int v17 = 776;
      __int16 v18 = 2082;
      unint64_t v19 = "-[MapsSuggestionsShortcutManager moveShortcutToFront:handler:]";
      __int16 v20 = 2082;
      int v21 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v6)
  {
    __int16 v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v16 = 1024;
      int v17 = 777;
      __int16 v18 = 2082;
      unint64_t v19 = "-[MapsSuggestionsShortcutManager moveShortcutToFront:handler:]";
      __int16 v20 = 2082;
      int v21 = "nil == (shortcut)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", location, 0x26u);
    }
LABEL_9:

    char v8 = 0;
    goto LABEL_10;
  }
  objc_initWeak((id *)location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MapsSuggestionsShortcutManager_moveShortcutToFront_handler___block_invoke;
  block[3] = &unk_1E5CB8720;
  objc_copyWeak(&v14, (id *)location);
  id v12 = v6;
  id v13 = v7;
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)location);
  char v8 = 1;
LABEL_10:

  return v8;
}

void __62__MapsSuggestionsShortcutManager_moveShortcutToFront_handler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] moveShortcutToFront:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsShortcutManager.mm";
      __int16 v7 = 1026;
      int v8 = 783;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsShortcutManager moveShortcutToFront:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (char)moveShortcutToBack:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    __int16 v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v16 = 1024;
      int v17 = 794;
      __int16 v18 = 2082;
      unint64_t v19 = "-[MapsSuggestionsShortcutManager moveShortcutToBack:handler:]";
      __int16 v20 = 2082;
      int v21 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v6)
  {
    __int16 v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v16 = 1024;
      int v17 = 795;
      __int16 v18 = 2082;
      unint64_t v19 = "-[MapsSuggestionsShortcutManager moveShortcutToBack:handler:]";
      __int16 v20 = 2082;
      int v21 = "nil == (shortcut)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires shortcuts", location, 0x26u);
    }
LABEL_9:

    char v8 = 0;
    goto LABEL_10;
  }
  objc_initWeak((id *)location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MapsSuggestionsShortcutManager_moveShortcutToBack_handler___block_invoke;
  block[3] = &unk_1E5CB8720;
  objc_copyWeak(&v14, (id *)location);
  id v12 = v6;
  id v13 = v7;
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)location);
  char v8 = 1;
LABEL_10:

  return v8;
}

void __61__MapsSuggestionsShortcutManager_moveShortcutToBack_handler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] moveShortcutToBack:*(void *)(a1 + 32) handler:*(void *)(a1 + 40)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsShortcutManager.mm";
      __int16 v7 = 1026;
      int v8 = 801;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsShortcutManager moveShortcutToBack:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (char)proposeAdditionalShortcutsOfType:(int64_t)a3 handler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    GEOFindOrCreateLog();
    __int16 v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromMapsSuggestionsShortcutType(a3);
      int v8 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      unint64_t v19 = v8;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "proposeAdditionalShortcutsOfType:%@", buf, 0xCu);
    }
    if (+[MapsSuggestionsSiri isEnabled])
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __75__MapsSuggestionsShortcutManager_proposeAdditionalShortcutsOfType_handler___block_invoke;
      v15[3] = &unk_1E5CB8F40;
      __int16 v16 = v6;
      int64_t v17 = a3;
      MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)&self->_queue, self, v15);
      char v9 = 1;
      id v10 = v16;
    }
    else
    {
      uint64_t v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for Maps. Showing nothing in proposed shortcuts", buf, 2u);
      }

      id v12 = (void *)MEMORY[0x1E4F28C58];
      id v13 = (void *)[[NSString alloc] initWithFormat:@"User turned off Siri Suggestions for Maps"];
      id v10 = [v12 GEOErrorWithCode:-8 reason:v13];

      (*((void (**)(id, void, NSObject *))v6 + 2))(v6, 0, v10);
      char v9 = 1;
    }
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446978;
      unint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutManager.mm";
      __int16 v20 = 1024;
      int v21 = 900;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsShortcutManager proposeAdditionalShortcutsOfType:handler:]";
      __int16 v24 = 2082;
      uint64_t v25 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    char v9 = 0;
  }

  return v9;
}

void __75__MapsSuggestionsShortcutManager_proposeAdditionalShortcutsOfType_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3[8], "count"));
  int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3[8], "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v3[8];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * v9) copy];
        if ([v10 isSetupPlaceholder]) {
          uint64_t v11 = v5;
        }
        else {
          uint64_t v11 = v4;
        }
        [v11 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__MapsSuggestionsShortcutManager_proposeAdditionalShortcutsOfType_handler___block_invoke_2;
  aBlock[3] = &unk_1E5CB8F18;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  id v24 = v12;
  uint64_t v25 = v13;
  id v14 = v4;
  id v21 = v14;
  id v15 = v5;
  id v22 = v15;
  __int16 v16 = v3;
  __int16 v23 = v16;
  int64_t v17 = _Block_copy(aBlock);
  if (![v16[3] loadAllShortcutsWithHandler:v17])
  {
    uint64_t v18 = *(void *)(a1 + 32);
    unint64_t v19 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"Could not call loadAllShortcutsWithHandler:"];
    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v19);
  }
}

void __75__MapsSuggestionsShortcutManager_proposeAdditionalShortcutsOfType_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v37 = v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Error loading existing Shortcuts: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", 2 * objc_msgSend(v5, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (([v13 isHidden] & 1) == 0)
          {
            id v14 = [v13 identifier];
            BOOL v15 = v14 == 0;

            if (!v15)
            {
              __int16 v16 = [v13 identifier];
              [v8 addObject:v16];
            }
            int64_t v17 = [v13 geoMapItem];
            uint64_t v18 = [v17 shortAddress];

            if (v18) {
              [v8 addObject:v18];
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v10);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__MapsSuggestionsShortcutManager_proposeAdditionalShortcutsOfType_handler___block_invoke_219;
    aBlock[3] = &unk_1E5CB8F18;
    id v19 = *(id *)(a1 + 56);
    uint64_t v20 = *(void *)(a1 + 64);
    id v29 = v19;
    uint64_t v30 = v20;
    id v21 = v8;
    id v26 = v21;
    id v27 = *(id *)(a1 + 32);
    id v28 = *(id *)(a1 + 40);
    id v22 = _Block_copy(aBlock);
    if (![*(id *)(*(void *)(a1 + 48) + 32) suggestShortcutsOfType:*(void *)(a1 + 64) handler:v22])
    {
      uint64_t v23 = *(void *)(a1 + 56);
      id v24 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:@"Could not call suggestShortcutsOfType:handler:"];
      (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v24);
    }
  }
}

void __75__MapsSuggestionsShortcutManager_proposeAdditionalShortcutsOfType_handler___block_invoke_219(void *a1, void *a2, void *a3)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v53 = v5;
  id v54 = a3;
  if (v54)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v69 = v54;
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "Error loading suggested Shortcuts: %@", buf, 0xCu);
    }

    uint64_t v7 = v54;
    (*(void (**)(void))(a1[7] + 16))();
    goto LABEL_81;
  }
  context = (void *)MEMORY[0x1AD0C8E80]();
  uint64_t v8 = a1[8];
  uint64_t v52 = a1;
  id v9 = (void *)a1[4];
  id v10 = v5;
  id v11 = v9;
  v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v61 objects:buf count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v62 != v13) {
          objc_enumerationMutation(obj);
        }
        BOOL v15 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if (!v8 || [*(id *)(*((void *)&v61 + 1) + 8 * i) type] == v8)
        {
          __int16 v16 = [v15 identifier];
          if (v16 && [v11 containsObject:v16])
          {
            int64_t v17 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint64_t v66 = 138412290;
              uint64_t v67 = v15;
              uint64_t v18 = v17;
              id v19 = "Already had Shortcut (by ID): %@";
              goto LABEL_29;
            }
          }
          else if ([v15 type] != 6 {
                 && ([v15 geoMapItem],
          }
                     uint64_t v20 = objc_claimAutoreleasedReturnValue(),
                     BOOL v21 = v20 == 0,
                     v20,
                     v21))
          {
            int64_t v17 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint64_t v66 = 138412290;
              uint64_t v67 = v15;
              uint64_t v18 = v17;
              id v19 = "Shortcut had no MapItem: %@";
LABEL_29:
              _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_DEBUG, v19, v66, 0xCu);
            }
          }
          else
          {
            id v22 = [v15 geoMapItem];
            int64_t v17 = [v22 shortAddress];

            if (v17 && [v11 containsObject:v17])
            {
              uint64_t v23 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)uint64_t v66 = 138412290;
                uint64_t v67 = v15;
                _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_DEBUG, "Already had Shortcut (by address): %@", v66, 0xCu);
              }
            }
            else
            {
              [v57 addObject:v15];
              if (v16) {
                [v11 addObject:v16];
              }
              if (v17) {
                [v11 addObject:v17];
              }
            }
          }

          continue;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v61 objects:buf count:16];
    }
    while (v12);
  }

  uint64_t v51 = (void *)[v57 copy];
  id v55 = [(id)v52[5] arrayByAddingObjectsFromArray:v51];
  if (GEOConfigGetBOOL())
  {
    id v24 = [(id)v52[6] arrayByAddingObjectsFromArray:v55];
  }
  else
  {
    id v24 = v55;
  }
  id v25 = v24;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v56 = v25;
  uint64_t v26 = [v56 countByEnumeratingWithState:&v61 objects:buf count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v62 != v27) {
          objc_enumerationMutation(v56);
        }
        if ([*(id *)(*((void *)&v61 + 1) + 8 * j) type] == 6)
        {

          goto LABEL_77;
        }
      }
      uint64_t v26 = [v56 countByEnumeratingWithState:&v61 objects:buf count:16];
    }
    while (v26);
  }

  uint64_t v50 = [[MapsSuggestionsShortcut alloc] initWithType:6 geoMapItem:0 customName:@"NearbyTransit"];
  [(MapsSuggestionsShortcut *)v50 setIdentifier:@"NearbyTransit"];

  if (!v50)
  {
LABEL_77:
    uint64_t v50 = 0;
    goto LABEL_78;
  }
  v65 = v50;
  id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
  uint64_t v30 = v52[8];
  long long v31 = (void *)v52[4];
  id v48 = v29;
  id v32 = v31;
  id v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v48, "count"));
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obja = v48;
  uint64_t v33 = [obja countByEnumeratingWithState:&v61 objects:buf count:16];
  if (!v33) {
    goto LABEL_73;
  }
  uint64_t v34 = *(void *)v62;
  do
  {
    for (uint64_t k = 0; k != v33; ++k)
    {
      if (*(void *)v62 != v34) {
        objc_enumerationMutation(obja);
      }
      id v36 = *(void **)(*((void *)&v61 + 1) + 8 * k);
      if (!v30 || [*(id *)(*((void *)&v61 + 1) + 8 * k) type] == v30)
      {
        id v37 = objc_msgSend(v36, "identifier", v48, context);
        if (v37 && [v32 containsObject:v37])
        {
          uint64_t v38 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)uint64_t v66 = 138412290;
            uint64_t v67 = v36;
            id v39 = v38;
            id v40 = "Already had Shortcut (by ID): %@";
            goto LABEL_69;
          }
        }
        else if ([v36 type] != 6 {
               && ([v36 geoMapItem],
        }
                   id v41 = objc_claimAutoreleasedReturnValue(),
                   BOOL v42 = v41 == 0,
                   v41,
                   v42))
        {
          uint64_t v38 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)uint64_t v66 = 138412290;
            uint64_t v67 = v36;
            id v39 = v38;
            id v40 = "Shortcut had no MapItem: %@";
LABEL_69:
            _os_log_impl(&dword_1A70DF000, v39, OS_LOG_TYPE_DEBUG, v40, v66, 0xCu);
          }
        }
        else
        {
          uint64_t v43 = [v36 geoMapItem];
          uint64_t v38 = [v43 shortAddress];

          if (v38 && [v32 containsObject:v38])
          {
            __int16 v44 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint64_t v66 = 138412290;
              uint64_t v67 = v36;
              _os_log_impl(&dword_1A70DF000, v44, OS_LOG_TYPE_DEBUG, "Already had Shortcut (by address): %@", v66, 0xCu);
            }
          }
          else
          {
            [v58 addObject:v36];
            if (v37) {
              [v32 addObject:v37];
            }
            if (v38) {
              [v32 addObject:v38];
            }
          }
        }

        continue;
      }
    }
    uint64_t v33 = [obja countByEnumeratingWithState:&v61 objects:buf count:16];
  }
  while (v33);
LABEL_73:

  int v45 = (void *)[v58 copy];
  if ([v45 count])
  {
    uint64_t v46 = [v45 arrayByAddingObjectsFromArray:v56];

    id v56 = (id)v46;
  }

LABEL_78:
  uint64_t v47 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v69 = v56;
    _os_log_impl(&dword_1A70DF000, v47, OS_LOG_TYPE_DEBUG, "Proposing Shortcuts: %@", buf, 0xCu);
  }

  (*(void (**)(void))(v52[7] + 16))();
  uint64_t v7 = 0;
LABEL_81:
}

- (NSString)uniqueName
{
  id v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  GEOFindOrCreateLog();
  uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [v6 uniqueName];
    *(_DWORD *)long long buf = 138412290;
    id v14 = v9;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Received MeCard update from %@", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__MapsSuggestionsShortcutManager_meCardReader_didUpdateMeCard___block_invoke;
  v11[3] = &unk_1E5CB8DB0;
  id v10 = v7;
  id v12 = v10;
  MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)&self->_queue, self, v11);
}

void __63__MapsSuggestionsShortcutManager_meCardReader_didUpdateMeCard___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  id v4 = (void *)v5[10];
  v5[10] = v3;

  -[MapsSuggestionsShortcutManager _loadCorrectedMeCardWithHandler:]((uint64_t)v5, &__block_literal_global_227);
}

void __63__MapsSuggestionsShortcutManager_meCardReader_didUpdateMeCard___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "Contacts resulted in auto-reload: %@ / error: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)mapsSync:(id)a3 didChangeForContentType:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  GEOFindOrCreateLog();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = [v5 uniqueName];
    *(_DWORD *)long long buf = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "Received MapsSync update from %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__MapsSuggestionsShortcutManager_mapsSync_didChangeForContentType___block_invoke;
  v8[3] = &unk_1E5CB8DB0;
  v8[4] = self;
  MSg::Queue::async<MapsSuggestionsShortcutManager>((NSObject **)&self->_queue, self, v8);
}

void __67__MapsSuggestionsShortcutManager_mapsSync_didChangeForContentType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id v4 = (void *)v3[7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__MapsSuggestionsShortcutManager_mapsSync_didChangeForContentType___block_invoke_2;
  v6[3] = &unk_1E5CB8F68;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [v4 shortcutsFromFavoritesWithHandler:v6];
}

void __67__MapsSuggestionsShortcutManager_mapsSync_didChangeForContentType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    GEOFindOrCreateLog();
    id v7 = (MapsSuggestionsMeCard *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      __int16 v16 = v6;
      _os_log_impl(&dword_1A70DF000, &v7->super, OS_LOG_TYPE_DEBUG, "MapsSync returned no shortcuts or an error: %@", buf, 0xCu);
    }
  }
  else
  {
    id v7 = [[MapsSuggestionsMeCard alloc] initWithShortcuts:v5 hasCorrected:0 hasGeocoded:0];
    if (![(MapsSuggestionsMeCard *)v7 isEqualToMeCard:*(void *)(*(void *)(a1 + 32) + 96)])
    {
      id v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        __int16 v16 = v7;
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "New MapsSync derived MeCard detected: %@", buf, 0xCu);
      }

      __int16 v9 = *(void **)(a1 + 40);
      id v10 = (void *)v9[11];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __67__MapsSuggestionsShortcutManager_mapsSync_didChangeForContentType___block_invoke_228;
      v12[3] = &unk_1E5CB82B0;
      uint64_t v13 = v9;
      uint64_t v11 = v7;
      id v14 = v11;
      [v10 callBlock:v12];

      id v7 = v11;
    }
  }
}

void __67__MapsSuggestionsShortcutManager_mapsSync_didChangeForContentType___block_invoke_228(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  GEOFindOrCreateLog();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [v3 uniqueName];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Calling observer '%@'", (uint8_t *)&v6, 0xCu);
  }
  [v3 meCardReader:*(void *)(a1 + 32) didUpdateMeCard:*(void *)(a1 + 40)];
}

uint64_t __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_229(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __56__MapsSuggestionsShortcutManager_readMeCardWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterMeCardObserver:(id)a3
{
}

- (id)storage
{
  return self->_storage;
}

- (id)suggestor
{
  return self->_suggestor;
}

- (id)routine
{
  return self->_routine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSchoolAddressStrings, 0);
  objc_storeStrong((id *)&self->_rawWorkAddressStrings, 0);
  objc_storeStrong((id *)&self->_rawHomeAddressStrings, 0);
  objc_storeStrong((id *)&self->_currCorrectedMeCard, 0);
  objc_storeStrong((id *)&self->_meCardObservers, 0);
  objc_storeStrong((id *)&self->_rawMeCard, 0);
  objc_storeStrong((id *)&self->_hiddenShortcuts, 0);
  objc_storeStrong((id *)&self->_mapsSync, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_routine, 0);
  objc_storeStrong((id *)&self->_suggestor, 0);
  objc_storeStrong((id *)&self->_storage, 0);

  innerQueue = self->_queue._innerQueue;
}

@end