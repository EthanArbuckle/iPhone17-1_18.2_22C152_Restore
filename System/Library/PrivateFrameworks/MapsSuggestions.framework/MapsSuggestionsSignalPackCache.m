@interface MapsSuggestionsSignalPackCache
- (BOOL)insertMapItem:(id)a3 signalPack:(id)a4 entry:(id)a5;
- (MapsSuggestionsSignalPackCache)init;
- (id)_containsSignalPackForMapItem:(void *)a1;
- (id)signalPackForMapItem:(id)a3;
- (uint64_t)_count;
- (void)_removeObjectsAtIndices:(void *)a1;
@end

@implementation MapsSuggestionsSignalPackCache

void __55__MapsSuggestionsSignalPackCache__removeExpiredEntries__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 hasExpired]) {
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

- (BOOL)insertMapItem:(id)a3 signalPack:(id)a4 entry:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v8 = a3;
  v29 = a4;
  id v30 = a5;
  if (v29)
  {
    if (v8)
    {
      if (!v30)
      {
        id v30 = [MEMORY[0x1E4F1CA98] null];
      }
      v9 = self;
      objc_sync_enter(v9);
      v28 = MapsSuggestionsMapItemConvertIfNeeded(v8);

      if (v9)
      {
        v10 = v9;
        objc_sync_enter(v10);
        v11 = (void *)[v10[3] copy];
        id v12 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __55__MapsSuggestionsSignalPackCache__removeExpiredEntries__block_invoke;
        *(void *)&buf[24] = &unk_1E5CBAAA8;
        id v13 = v12;
        *(void *)&buf[32] = v13;
        [v11 enumerateObjectsUsingBlock:buf];
        v14 = (void *)[v13 copy];
        -[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:](v10, v14);

        objc_sync_exit(v10);
      }
      while (1)
      {
        unint64_t v15 = -[MapsSuggestionsSignalPackCache _count](v9);
        if (v15 < GEOConfigGetInteger()) {
          break;
        }
        v16 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "Popping a row because we hit the limit on the number of entries in the cache", buf, 2u);
        }

        if (v9)
        {
          v17 = v9;
          objc_sync_enter(v17);
          if (-[MapsSuggestionsSignalPackCache _count](v17))
          {
            v18 = [objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:0];
            -[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:](v17, v18);
          }
          else
          {
            v18 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "This should NOT have happened. Cannot pop when the count is zero!!", buf, 2u);
            }
          }

          objc_sync_exit(v17);
        }
      }
      v19 = -[MapsSuggestionsSignalPackCache _containsSignalPackForMapItem:](v9, v28);
      if (v19)
      {
        GEOFindOrCreateLog();
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v21 = [v19 unsignedIntegerValue];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v21;
          _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "Removing an existing mapItem because we are refreshing the cache. Removing index %lu", buf, 0xCu);
        }

        v22 = -[NSMutableArray objectAtIndexedSubscript:](v9->_signalPacks, "objectAtIndexedSubscript:", [v19 unsignedIntegerValue]);
        v23 = (void *)[v22 mutableCopy];

        [v29 mergeIntoSignalPack:v23];
        v24 = [v23 copy];

        v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndex:", objc_msgSend(v19, "unsignedIntegerValue"));
        -[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:](v9, v25);
      }
      else
      {
        v24 = v29;
      }
      [(NSMutableArray *)v9->_mapItems addObject:v28];
      [(NSMutableArray *)v9->_signalPacks addObject:v24];
      [(NSMutableArray *)v9->_entries addObject:v30];

      objc_sync_exit(v9);
      BOOL v26 = 1;
      v8 = v28;
    }
    else
    {
      v24 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 44;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "-[MapsSuggestionsSignalPackCache insertMapItem:signalPack:entry:]";
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = "nil == (mapItem)";
        _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. mapItem cannot be nil", buf, 0x26u);
      }
      BOOL v26 = 0;
      v8 = v29;
    }
  }
  else
  {
    v24 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 43;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsSignalPackCache insertMapItem:signalPack:entry:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (signalPack)";
      _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. signalPack cannot be nil", buf, 0x26u);
    }
    BOOL v26 = 0;
  }

  return v26;
}

- (void)_removeObjectsAtIndices:(void *)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      id v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136446978;
        id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
        __int16 v13 = 1024;
        int v14 = 172;
        __int16 v15 = 2082;
        v16 = "-[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:]";
        __int16 v17 = 2082;
        v18 = "nil == (indexSet)";
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an index set", (uint8_t *)&v11, 0x26u);
      }
      goto LABEL_18;
    }
    id v5 = a1;
    objc_sync_enter(v5);
    uint64_t v6 = [(objc_class *)v5[1].isa count];
    if (v6 == [(objc_class *)v5[2].isa count])
    {
      uint64_t v7 = [(objc_class *)v5[1].isa count];
      if (v7 == [(objc_class *)v5[3].isa count])
      {
        uint64_t v8 = [(objc_class *)v5[3].isa count];
        if (v8 == [(objc_class *)v5[2].isa count])
        {
          [(objc_class *)v5[1].isa removeObjectsAtIndexes:v4];
          [(objc_class *)v5[2].isa removeObjectsAtIndexes:v4];
          [(objc_class *)v5[3].isa removeObjectsAtIndexes:v4];
LABEL_17:
          objc_sync_exit(v5);
LABEL_18:

          goto LABEL_19;
        }
        v9 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v11 = 136446978;
          id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
          __int16 v13 = 1024;
          int v14 = 177;
          __int16 v15 = 2082;
          v16 = "-[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:]";
          __int16 v17 = 2082;
          v18 = "_entries.count != _signalPacks.count";
          v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. The number of entries should always be the same as the"
                " number of signalPacks";
          goto LABEL_15;
        }
LABEL_16:

        goto LABEL_17;
      }
      v9 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      int v11 = 136446978;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
      __int16 v13 = 1024;
      int v14 = 176;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:]";
      __int16 v17 = 2082;
      v18 = "_mapItems.count != _entries.count";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. The number of mapItems should always be the same as the number of entries";
    }
    else
    {
      v9 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      int v11 = 136446978;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
      __int16 v13 = 1024;
      int v14 = 175;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsSignalPackCache _removeObjectsAtIndices:]";
      __int16 v17 = 2082;
      v18 = "_mapItems.count != _signalPacks.count";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. The number of mapItems should always be the same as the nu"
            "mber of signalPacks";
    }
LABEL_15:
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0x26u);
    goto LABEL_16;
  }
LABEL_19:
}

- (uint64_t)_count
{
  if (!a1) {
    return 0;
  }
  v1 = a1;
  objc_sync_enter(v1);
  uint64_t v2 = [v1[1] count];
  objc_sync_exit(v1);

  return v2;
}

- (id)_containsSignalPackForMapItem:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      id v5 = a1;
      objc_sync_enter(v5);
      uint64_t v6 = (void *)[(objc_class *)v5[1].isa copy];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      *(void *)&buf[24] = -1;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      int v11 = __64__MapsSuggestionsSignalPackCache__containsSignalPackForMapItem___block_invoke;
      id v12 = &unk_1E5CBAAD0;
      id v13 = v4;
      int v14 = buf;
      [v6 enumerateObjectsWithOptions:2 usingBlock:&v9];
      if (*(void *)(*(void *)&buf[8] + 24) == -1)
      {
        uint64_t v7 = 0;
      }
      else
      {
        uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", v9, v10, v11, v12);
      }

      _Block_object_dispose(buf, 8);
      objc_sync_exit(v5);
    }
    else
    {
      id v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 119;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "-[MapsSuggestionsSignalPackCache _containsSignalPackForMapItem:]";
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = "nil == (mapItem)";
        _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. mapItem cannot be nil", buf, 0x26u);
      }
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __64__MapsSuggestionsSignalPackCache__containsSignalPackForMapItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = MapsSuggestionsMapItemsAreEqual(a2, *(void **)(a1 + 32), 0, 0, 0);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (MapsSuggestionsSignalPackCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)MapsSuggestionsSignalPackCache;
  uint64_t v2 = [(MapsSuggestionsSignalPackCache *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    mapItems = v2->_mapItems;
    v2->_mapItems = (NSMutableArray *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    signalPacks = v2->_signalPacks;
    v2->_signalPacks = (NSMutableArray *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v7;
  }
  return v2;
}

- (id)signalPackForMapItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = -[MapsSuggestionsSignalPackCache _containsSignalPackForMapItem:](v5, v4);
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = -[NSMutableArray objectAtIndexedSubscript:](v5->_signalPacks, "objectAtIndexedSubscript:", [v6 unsignedIntegerValue]);
    }
    else
    {
      GEOFindOrCreateLog();
      uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_super v10 = [v4 shortAddress];
        int v12 = 138412290;
        id v13 = v10;
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "signalPack not found for mapItem %@", (uint8_t *)&v12, 0xCu);
      }
      uint64_t v8 = 0;
    }

    objc_sync_exit(v5);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (MapsSuggestionsSignalPackCache *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      id v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackCache.m";
      __int16 v14 = 1024;
      int v15 = 143;
      __int16 v16 = 2082;
      __int16 v17 = "-[MapsSuggestionsSignalPackCache signalPackForMapItem:]";
      __int16 v18 = 2082;
      uint64_t v19 = "nil == (mapItem)";
      _os_log_impl(&dword_1A70DF000, &v5->super, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. mapItem cannot be nil", (uint8_t *)&v12, 0x26u);
    }
    uint64_t v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_signalPacks, 0);
  objc_storeStrong((id *)&self->_mapItems, 0);
}

@end