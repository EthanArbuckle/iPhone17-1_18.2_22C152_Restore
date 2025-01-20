@interface GEOConfigStorageCached
- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6;
- (id)initForSource:(int64_t)a3;
- (void)resync;
- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6;
@end

@implementation GEOConfigStorageCached

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v10 length];
  if ((a5 & 0x2000) != 0 && v12 && (direct = self->_direct) != 0)
  {
    v14 = [(GEOConfigStorageReadOnly *)direct getConfigValueForKey:v10 countryCode:v11 options:a5 source:a6];
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    if (!self->_cachedValues)
    {
      os_unfair_recursive_lock_unlock();
      os_unfair_recursive_lock_lock_with_options();
      if (!self->_cachedValues) {
        [(GEOConfigStorageCached *)self resync];
      }
    }
    uint64_t v15 = [v10 length];
    cachedValues = self->_cachedValues;
    if (v15)
    {
      GEOConfig_getCountryAwareValueForKeyFromDictionary(v11, v10, cachedValues);
      v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v17 = GEOConfig_stripEntitlement(v10);
        v18 = GEOConfig_getCountryAwareValueForKeyFromDictionary(v11, v17, self->_cachedValues);
        if (v18)
        {
          v19 = +[GEOConfigStorageClient shared];
          [v19 migrateEntitledKey:v10 options:a5];

          v20 = +[GEOApplicationAuditToken currentProcessAuditToken];
          id v25 = 0;
          int v21 = GEOConfig_validateEntitlementForKey(v10, v20, &v25);
          id v22 = v25;

          if (v21)
          {
            v14 = v18;
          }
          else
          {
            v23 = j__GEOGetUserDefaultsLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v27 = v22;
              _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "Not allowing access (read): %@", buf, 0xCu);
            }

            v14 = 0;
          }
        }
        else
        {
          v14 = 0;
        }
      }
    }
    else
    {
      v14 = cachedValues;
    }
    os_unfair_recursive_lock_unlock();
    if (a6 && v14) {
      *a6 = self->_source;
    }
  }

  return v14;
}

- (id)initForSource:(int64_t)a3
{
  v3 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOConfigStorageCached;
    v5 = [(GEOConfigStorageCached *)&v13 init];
    v3 = v5;
    if (v5)
    {
      v5->_source = a3;
      switch(a3)
      {
        case 1:
        case 4:
        case 5:
        case 9:
          v5->_options = 0;
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
            goto LABEL_5;
          }
          *(_WORD *)buf = 0;
          id v10 = MEMORY[0x1E4F14500];
          id v11 = "Assertion failed: _options != GEOConfigOption_None";
          goto LABEL_18;
        case 3:
          v5->_options = 0x10000;
          v5->_cacheLock = 0;
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
            goto LABEL_10;
          }
          goto LABEL_19;
        case 6:
          v5->_options = 0x20000;
          v5->_cacheLock = 0;
          uint64_t v7 = _GEOConfigStorageDirectSystemReadOnly();
          goto LABEL_14;
        case 7:
          v5->_options = 0x40000;
          v5->_cacheLock = 0;
          uint64_t v7 = _GEOConfigStorageDirectUserReadOnly();
          goto LABEL_14;
        case 8:
          uint64_t v7 = 0;
          v3->_options = 0x80000;
          v3->_cacheLock = 0;
          goto LABEL_14;
        default:
          v5->_options = 983040;
          v5->_cacheLock = 0;
          if (a3 != 2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
LABEL_19:
            uint64_t v12 = GEODefaultsSourceAsString(a3);
            *(_DWORD *)buf = 138412290;
            uint64_t v15 = v12;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: source == %@", buf, 0xCu);
          }
LABEL_10:
          uint64_t v7 = 0;
LABEL_14:
          direct = v3->_direct;
          v3->_direct = (GEOConfigStorageReadOnly *)v7;

          break;
      }
    }
    v3 = v3;
    v6 = v3;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = MEMORY[0x1E4F14500];
      id v11 = "Assertion failed: source != GEODefaultsSourceNone";
LABEL_18:
      _os_log_fault_impl(&dword_188D96000, v10, OS_LOG_TYPE_FAULT, v11, buf, 2u);
    }
LABEL_5:
    v6 = 0;
  }

  return v6;
}

- (void)resync
{
  p_isResyncing = &self->_isResyncing;
  if ((atomic_exchange(&self->_isResyncing._Value, 1u) & 1) == 0)
  {
    [(GEOConfigStorageReadOnly *)self->_direct resync];
    v4 = +[GEOConfigStorageClient shared];
    id v6 = [v4 getAllKeysAndValuesForOptions:self->_options];

    os_unfair_recursive_lock_lock_with_options();
    if (v6) {
      v5 = v6;
    }
    else {
      v5 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&self->_cachedValues, v5);
    os_unfair_recursive_lock_unlock();
    atomic_store(0, (unsigned __int8 *)p_isResyncing);
  }
}

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[GEOConfigStorageClient shared];
  [v11 setConfigValue:v10 forKey:v9 options:a5 synchronous:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_direct, 0);

  objc_storeStrong((id *)&self->_cachedValues, 0);
}

@end