@interface AAUIServerSuppliedProfilePictureCache
+ (id)sharedCache;
- (AAUIServerSuppliedProfilePictureCache)init;
- (BOOL)updateProfilePicture:(id)a3 didReceiveNewPicture:(BOOL)a4 serverCacheTag:(id)a5 forPersonID:(id)a6;
- (double)pictureDiameter;
- (id)_entryForPersonID:(id)a3;
- (id)profilePictureForPersonID:(id)a3 diameter:(double)a4 serverFetchBlock:(id)a5;
- (id)serverCacheTagForPersonID:(id)a3 diameter:(double)a4;
- (void)_ensureMinimumPictureDiameter_mustBeSynchronized:(double)a3;
- (void)profilePictureForPersonID:(id)a3 diameter:(double)a4 completion:(id)a5;
@end

@implementation AAUIServerSuppliedProfilePictureCache

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedCache___sharedCache;
  return v2;
}

uint64_t __52__AAUIServerSuppliedProfilePictureCache_sharedCache__block_invoke()
{
  sharedCache___sharedCache = objc_alloc_init(AAUIServerSuppliedProfilePictureCache);
  return MEMORY[0x270F9A758]();
}

- (AAUIServerSuppliedProfilePictureCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIServerSuppliedProfilePictureCache;
  v2 = [(AAUIServerSuppliedProfilePictureCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    personIDToEntryMap = v2->_personIDToEntryMap;
    v2->_personIDToEntryMap = v3;

    v2->_pictureDiameter = 60.0;
  }
  return v2;
}

- (double)pictureDiameter
{
  v3 = self->_personIDToEntryMap;
  objc_sync_enter(v3);
  double pictureDiameter = self->_pictureDiameter;
  objc_sync_exit(v3);

  return pictureDiameter;
}

- (void)_ensureMinimumPictureDiameter_mustBeSynchronized:(double)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (self->_pictureDiameter < a3)
  {
    v5 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v6 = [NSNumber numberWithDouble:a3];
      v7 = [NSNumber numberWithDouble:self->_pictureDiameter];
      *(_DWORD *)buf = 138412546;
      v23 = v6;
      __int16 v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore _ensureMinimumPictureDiameter: %@ _pictureDiameter %@. Will expire all cached pictures.", buf, 0x16u);
    }
    obj = self->_personIDToEntryMap;
    objc_sync_enter(obj);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v8 = [(NSMutableDictionary *)self->_personIDToEntryMap allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v13 = [(AAUIServerSuppliedProfilePictureCache *)self _entryForPersonID:v12];
          v14 = _AAUIPPSLogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v12;
            _os_log_impl(&dword_209754000, v14, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore _ensureMinimumPictureDiameter: Expiring cache entry for %@", buf, 0xCu);
          }

          [v13 expire];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    objc_sync_exit(obj);
    v15 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore _ensureMinimumPictureDiameter: Did expire all cached pictures.", buf, 2u);
    }

    self->_double pictureDiameter = a3;
  }
}

- (id)serverCacheTagForPersonID:(id)a3 diameter:(double)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [NSNumber numberWithDouble:a4];
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ diameter: %@", (uint8_t *)&v12, 0x16u);
  }
  if (v6)
  {
    [(AAUIServerSuppliedProfilePictureCache *)self _ensureMinimumPictureDiameter_mustBeSynchronized:a4];
    uint64_t v9 = [(AAUIServerSuppliedProfilePictureCache *)self _entryForPersonID:v6];
    uint64_t v10 = [v9 serverCacheTag];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)profilePictureForPersonID:(id)a3 diameter:(double)a4 serverFetchBlock:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, NSObject *))a5;
  uint64_t v10 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [NSNumber numberWithDouble:a4];
    int v19 = 138412546;
    id v20 = v8;
    __int16 v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ diameter: %@", (uint8_t *)&v19, 0x16u);
  }
  if (v8)
  {
    [(AAUIServerSuppliedProfilePictureCache *)self _ensureMinimumPictureDiameter_mustBeSynchronized:a4];
    int v12 = [(AAUIServerSuppliedProfilePictureCache *)self _entryForPersonID:v8];
    id v13 = [v12 picture];
    if (([v12 updating] & 1) != 0 || !objc_msgSend(v12, "expired"))
    {
      v15 = _AAUIPPSLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "performServerFetch is False", (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      __int16 v14 = _AAUIPPSLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_209754000, v14, OS_LOG_TYPE_DEFAULT, "performServerFetch is True", (uint8_t *)&v19, 2u);
      }

      [v12 setUpdating:1];
      v15 = [v12 serverCacheTag];
      uint64_t v16 = _AAUIPPSLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        id v20 = v8;
        _os_log_impl(&dword_209754000, v16, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ triggering performServerFetch", (uint8_t *)&v19, 0xCu);
      }

      v9[2](v9, v15);
    }
  }
  else
  {
    id v13 = 0;
  }
  long long v17 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v8;
    __int16 v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_209754000, v17, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ returning profilePicture %@", (uint8_t *)&v19, 0x16u);
  }

  return v13;
}

- (void)profilePictureForPersonID:(id)a3 diameter:(double)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *, void *, uint64_t))a5;
  uint64_t v10 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [NSNumber numberWithDouble:a4];
    int v19 = 138412546;
    id v20 = v8;
    __int16 v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ diameter: %@ completion:", (uint8_t *)&v19, 0x16u);
  }
  if (v8)
  {
    [(AAUIServerSuppliedProfilePictureCache *)self _ensureMinimumPictureDiameter_mustBeSynchronized:a4];
    int v12 = [(AAUIServerSuppliedProfilePictureCache *)self _entryForPersonID:v8];
    id v13 = [v12 picture];
    __int16 v14 = [v12 serverCacheTag];
    uint64_t v15 = [v12 expired];
    uint64_t v16 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = [NSNumber numberWithBool:v15];
      int v19 = 138413058;
      id v20 = v8;
      __int16 v21 = 2112;
      v22 = v13;
      __int16 v23 = 2112;
      __int16 v24 = v14;
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      _os_log_impl(&dword_209754000, v16, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ completion: calling completion with profilePicture %@ serverCacheTag %@ performServerFetch %@", (uint8_t *)&v19, 0x2Au);
    }
    v9[2](v9, v13, v14, v15);
  }
  else
  {
    long long v18 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = 0;
      _os_log_impl(&dword_209754000, v18, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForPersonID: %@ completion: No personID provided!", (uint8_t *)&v19, 0xCu);
    }

    v9[2](v9, 0, 0, 0);
  }
}

- (BOOL)updateProfilePicture:(id)a3 didReceiveNewPicture:(BOOL)a4 serverCacheTag:(id)a5 forPersonID:(id)a6
{
  BOOL v8 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = [NSNumber numberWithBool:v8];
    int v26 = 138413058;
    id v27 = v10;
    __int16 v28 = 2112;
    v29 = v14;
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2112;
    id v33 = v12;
    _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore updateProfilePicture: %@ didReceiveNewPicture: %@ serverCacheTag: %@ forPersonID: %@", (uint8_t *)&v26, 0x2Au);
  }
  if (v12)
  {
    if (!v10 || ([v10 size], v15 == self->_pictureDiameter))
    {
      uint64_t v16 = [(AAUIServerSuppliedProfilePictureCache *)self _entryForPersonID:v12];
      id v20 = _AAUIPPSLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = [NSNumber numberWithBool:v8];
        int v26 = 138413314;
        id v27 = v10;
        __int16 v28 = 2112;
        v29 = v21;
        __int16 v30 = 2112;
        id v31 = v11;
        __int16 v32 = 2112;
        id v33 = v12;
        __int16 v34 = 2112;
        v35 = v16;
        _os_log_impl(&dword_209754000, v20, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore updateProfilePicture: %@ didReceiveNewPicture: %@ serverCacheTag: %@ forPersonID: %@ updating entry %@", (uint8_t *)&v26, 0x34u);
      }
      [v16 setUpdating:0];
      if (v8)
      {
        id v22 = [v16 picture];
        LOBYTE(v8) = v22 != v10;

        [v16 setPicture:v10];
        if (v11) {
          [v16 setServerCacheTag:v11];
        }
        __int16 v23 = _AAUIPPSLogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v24 = [NSNumber numberWithBool:1];
          int v26 = 138413314;
          id v27 = v10;
          __int16 v28 = 2112;
          v29 = v24;
          __int16 v30 = 2112;
          id v31 = v11;
          __int16 v32 = 2112;
          id v33 = v12;
          __int16 v34 = 2112;
          v35 = v16;
          _os_log_impl(&dword_209754000, v23, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore updateProfilePicture: %@ didReceiveNewPicture: %@ serverCacheTag: %@ forPersonID: %@ did update entry %@", (uint8_t *)&v26, 0x34u);
        }
      }
      else
      {
        [v16 extendExpirationDate];
      }
    }
    else
    {
      uint64_t v16 = _AAUIPPSLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        long long v17 = (void *)MEMORY[0x263F08D40];
        [v10 size];
        long long v18 = objc_msgSend(v17, "valueWithCGSize:");
        int v19 = [NSNumber numberWithDouble:self->_pictureDiameter];
        int v26 = 138412802;
        id v27 = v12;
        __int16 v28 = 2112;
        v29 = v18;
        __int16 v30 = 2112;
        id v31 = v19;
        _os_log_impl(&dword_209754000, v16, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore updateProfilePicture: ... forPersonID: %@ ignoring picture with size %@ different from _pictureDiameter %@", (uint8_t *)&v26, 0x20u);
      }
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_entryForPersonID:(id)a3
{
  id v4 = a3;
  v5 = self->_personIDToEntryMap;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->_personIDToEntryMap objectForKey:v4];
  if (v6)
  {
    v7 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AAUIServerSuppliedProfilePictureCache _entryForPersonID:]();
    }
  }
  else
  {
    id v6 = objc_alloc_init(AAUIServerSuppliedProfilePictureCacheEntry);
    [(NSMutableDictionary *)self->_personIDToEntryMap setObject:v6 forKey:v4];
    v7 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AAUIServerSuppliedProfilePictureCache _entryForPersonID:]();
    }
  }

  objc_sync_exit(v5);
  return v6;
}

- (void).cxx_destruct
{
}

- (void)_entryForPersonID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_209754000, v0, v1, "[AAUIServerSuppliedProfilePictureCache entryForPersonID]: %@ Created entry %@");
}

- (void)_entryForPersonID:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_209754000, v0, v1, "[AAUIServerSuppliedProfilePictureCache entryForPersonID]: %@ Found entry %@");
}

@end