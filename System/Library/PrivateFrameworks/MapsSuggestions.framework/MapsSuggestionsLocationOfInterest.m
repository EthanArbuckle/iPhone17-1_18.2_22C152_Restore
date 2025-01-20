@interface MapsSuggestionsLocationOfInterest
- (BOOL)isHomeOrWork;
- (BOOL)isLOIFromMeCard;
- (GEOMapItemStorage)mapItem;
- (MapsSuggestionsLocationOfInterest)initWithLOI:(id)a3;
- (NSData)mapItemHandle;
- (NSString)addressIdentifier;
- (NSString)identifierString;
- (NSString)preferredName;
- (NSUUID)identifierUUID;
- (char)hydrateMapItemWithNetworkRequester:(id)a3 completion:(id)a4;
- (int64_t)shortcutType;
- (int64_t)type;
- (unint64_t)visitCount;
- (void)setMapItem:(id)a3;
- (void)setVisitCount:(unint64_t)a3;
@end

@implementation MapsSuggestionsLocationOfInterest

- (char)hydrateMapItemWithNetworkRequester:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutine.mm";
      __int16 v27 = 1024;
      *(_DWORD *)v28 = 106;
      *(_WORD *)&v28[4] = 2082;
      *(void *)&v28[6] = "-[MapsSuggestionsLocationOfInterest hydrateMapItemWithNetworkRequester:completion:]";
      __int16 v29 = 2082;
      v30 = "nil == (completion)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completionHandler", buf, 0x26u);
    }

    goto LABEL_11;
  }
  if (!self->_mapItemHandle)
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      identifierString = self->_identifierString;
      preferredName = self->_preferredName;
      *(_DWORD *)buf = 138412546;
      v26 = (const char *)identifierString;
      __int16 v27 = 2112;
      *(void *)v28 = preferredName;
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "LOI with ID: %@, name:%@ has no mapItemHandle. Returning.", buf, 0x16u);
    }

LABEL_11:
    char v9 = 0;
    goto LABEL_12;
  }
  if (self->_mapItem)
  {
    v8 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__MapsSuggestionsLocationOfInterest_hydrateMapItemWithNetworkRequester_completion___block_invoke;
    block[3] = &unk_1E5CB8368;
    id v24 = v7;
    dispatch_async(v8, block);

    char v9 = 1;
  }
  else
  {
    objc_initWeak(&location, self);
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v17 = self->_identifierString;
      v16 = self->_preferredName;
      *(_DWORD *)buf = 138412546;
      v26 = (const char *)v16;
      __int16 v27 = 2112;
      *(void *)v28 = v17;
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "About to hydrate the mapItem for an LOI with name: %@, identifier: %@", buf, 0x16u);
    }

    v18 = [(MapsSuggestionsLocationOfInterest *)self mapItemHandle];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __83__MapsSuggestionsLocationOfInterest_hydrateMapItemWithNetworkRequester_completion___block_invoke_207;
    v19[3] = &unk_1E5CB8E78;
    objc_copyWeak(&v21, &location);
    id v20 = v7;
    char v9 = [v6 resolveMapItemHandleData:v18 completion:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
LABEL_12:

  return v9;
}

uint64_t __83__MapsSuggestionsLocationOfInterest_hydrateMapItemWithNetworkRequester_completion___block_invoke(uint64_t a1)
{
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "Calling back with a pre-existing mapItem. No need to rehydrate again.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__MapsSuggestionsLocationOfInterest_hydrateMapItemWithNetworkRequester_completion___block_invoke_207(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(21, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__MapsSuggestionsLocationOfInterest_hydrateMapItemWithNetworkRequester_completion___block_invoke_2;
  v10[3] = &unk_1E5CB8798;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v11 = v6;
  id v12 = v5;
  id v13 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void __83__MapsSuggestionsLocationOfInterest_hydrateMapItemWithNetworkRequester_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32) || ![*(id *)(a1 + 40) count])
    {
      v3 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = *(char **)(a1 + 32);
        int v8 = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "LOI: Could not resolve mapItemHandle, error: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      if ([WeakRetained isHomeOrWork]
        && MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken != -1)
      {
        dispatch_once(&MapsSuggestionsSawHomeOrWorkOnThisDevice::s_onceToken, &__block_literal_global_25);
      }
      id v6 = [*(id *)(a1 + 40) firstObject];
      id v7 = MapsSuggestionsMapItemConvertIfNeeded(v6);
      [WeakRetained setMapItem:v7];

      v3 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Successfully retrieved a mapItem on the LOI", (uint8_t *)&v8, 2u);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      id v9 = "MapsSuggestionsRoutine.mm";
      __int16 v10 = 1026;
      int v11 = 126;
      __int16 v12 = 2082;
      id v13 = "-[MapsSuggestionsLocationOfInterest hydrateMapItemWithNetworkRequester:completion:]_block_invoke_2";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (NSData)mapItemHandle
{
  return self->_mapItemHandle;
}

- (GEOMapItemStorage)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (NSUUID)identifierUUID
{
  return self->_identifierUUID;
}

- (NSString)identifierString
{
  return self->_identifierString;
}

- (NSString)preferredName
{
  return self->_preferredName;
}

- (int64_t)shortcutType
{
  return self->_shortcutType;
}

- (BOOL)isLOIFromMeCard
{
  return self->_isLOIFromMeCard;
}

- (NSString)addressIdentifier
{
  return self->_addressIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)visitCount
{
  return self->_visitCount;
}

- (void)setVisitCount:(unint64_t)a3
{
  self->_visitCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredName, 0);
  objc_storeStrong((id *)&self->_identifierString, 0);
  objc_storeStrong((id *)&self->_identifierUUID, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_mapItemHandle, 0);
}

- (MapsSuggestionsLocationOfInterest)initWithLOI:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MapsSuggestionsLocationOfInterest;
  id v5 = [(MapsSuggestionsLocationOfInterest *)&v23 init];
  if (v5)
  {
    id v6 = [v4 mapItem];
    uint64_t v7 = [v6 geoMapItemHandle];
    mapItemHandle = v5->_mapItemHandle;
    v5->_mapItemHandle = (NSData *)v7;

    uint64_t v9 = [v4 identifier];
    identifierUUID = v5->_identifierUUID;
    v5->_identifierUUID = (NSUUID *)v9;

    int v11 = [v4 identifier];
    uint64_t v12 = [v11 UUIDString];
    identifierString = v5->_identifierString;
    v5->_identifierString = (NSString *)v12;

    uint64_t v14 = [v4 preferredName];
    preferredName = v5->_preferredName;
    v5->_preferredName = (NSString *)v14;

    v16 = [v4 mapItem];
    v17 = [v16 extendedAttributes];
    uint64_t v18 = [v17 addressIdentifier];
    addressIdentifier = v5->_addressIdentifier;
    v5->_addressIdentifier = (NSString *)v18;

    v5->_isLOIFromMeCard = [v4 typeSource] & 1;
    v5->_type = shortcutTypeForRTLOIType([v4 type]);
    id v20 = [v4 visits];
    v5->_visitCount = [v20 count];

    id v21 = v5;
  }

  return v5;
}

- (BOOL)isHomeOrWork
{
  return [(MapsSuggestionsLocationOfInterest *)self type] == 2
      || [(MapsSuggestionsLocationOfInterest *)self type] == 3;
}

@end