@interface GEOConfigStorageDirectReadOnly
- (GEOConfigStorageDirectReadOnly)initWithPath:(id)a3 forSource:(int64_t)a4;
- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6;
- (uint64_t)_readStore;
@end

@implementation GEOConfigStorageDirectReadOnly

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  id v9 = a3;
  id v10 = a4;
  os_unfair_lock_lock_with_options();
  if (v9)
  {
    uint64_t v11 = GEOConfig_getCountryAwareValueForKeyFromDictionary(v10, v9, self->_valueStore);
  }
  else
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_valueStore copy];
  }
  v12 = (void *)v11;
  os_unfair_lock_unlock(&self->_valueStoreLock);
  if (a6 && v12) {
    *a6 = self->_source;
  }

  return v12;
}

- (uint64_t)_readStore
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (atomic_exchange((atomic_uchar *volatile)(result + 40), 1u)) {
      return 0;
    }
    uint64_t v2 = *(void *)(result + 16);
    id v23 = 0;
    v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2 options:1 error:&v23];
    id v4 = v23;
    if ([v3 length])
    {
      id v22 = 0;
      v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:1 format:0 error:&v22];
      id v6 = v22;

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        os_unfair_lock_lock_with_options();
        objc_storeStrong((id *)(v1 + 32), v5);
        os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
      }
      else
      {
        id v10 = j__GEOGetUserDefaultsLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = *(void *)(v1 + 16);
          *(_DWORD *)buf = 138412546;
          uint64_t v26 = v11;
          __int16 v27 = 2112;
          id v28 = v6;
          _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "Unable to parse direct store at %@: %@", buf, 0x16u);
        }

        if (+[GEOPlatform isRunningInGeod])
        {
          v12 = [MEMORY[0x1E4F28CB8] defaultManager];
          uint64_t v13 = *(void *)(v1 + 16);
          id v21 = v6;
          char v14 = [v12 removeItemAtURL:v13 error:&v21];
          id v4 = v21;

          if ((v14 & 1) == 0)
          {
            v15 = j__GEOGetUserDefaultsLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              uint64_t v16 = *(void *)(v1 + 16);
              *(_DWORD *)buf = 138412546;
              uint64_t v26 = v16;
              __int16 v27 = 2112;
              id v28 = v4;
              _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Unable to remove corrupt store at %@: %@", buf, 0x16u);
            }
          }
          goto LABEL_26;
        }
      }
      id v4 = v6;
LABEL_26:

      goto LABEL_27;
    }
    if (!v4)
    {
LABEL_27:
      atomic_store(0, (unsigned __int8 *)(v1 + 40));
      char v20 = 1;
      goto LABEL_28;
    }
    v7 = [v4 domain];
    uint64_t v8 = *MEMORY[0x1E4F281F8];
    if ([v7 isEqual:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v9 = [v4 code];

      if (v9 == 260)
      {
LABEL_23:
        v5 = [v4 domain];
        if (![v5 isEqual:v8]) {
          goto LABEL_26;
        }
        uint64_t v19 = [v4 code];

        if (v19 == 257)
        {
          char v20 = 0;
LABEL_28:
          unsigned __int8 v24 = v20;

          return v24;
        }
        goto LABEL_27;
      }
    }
    else
    {
    }
    v17 = j__GEOGetUserDefaultsLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(v1 + 16);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v18;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, "Unable to read direct store at %@: %@", buf, 0x16u);
    }

    goto LABEL_23;
  }
  return result;
}

- (GEOConfigStorageDirectReadOnly)initWithPath:(id)a3 forSource:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOConfigStorageDirectReadOnly;
  v7 = [(GEOConfigStorageDirectReadOnly *)&v15 init];
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_3;
  }
  v7->_valueStoreLock._os_unfair_lock_opaque = 0;
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  valueStore = v8->_valueStore;
  v8->_valueStore = (NSMutableDictionary *)v9;

  uint64_t v11 = [v6 copy];
  path = v8->_path;
  v8->_path = (NSURL *)v11;

  v8->_source = a4;
  if (!-[GEOConfigStorageDirectReadOnly _readStore]((uint64_t)v8)) {
    uint64_t v13 = 0;
  }
  else {
LABEL_3:
  }
    uint64_t v13 = v8;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueStore, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end