@interface GEOConfigStorageExpiryCached
- (BOOL)getConfigKeyExpiry:(id)a3 date:(id *)a4 osVersion:(id *)a5;
- (BOOL)getConfigKeyIsExpired:(id)a3;
- (id)_expiryForKey:(id)a3;
- (id)getAllExpiringKeys;
- (id)initForSource:(int64_t)a3;
- (void)clearConfigKeyExpiry:(id)a3;
- (void)resync;
- (void)setConfigKeyExpiry:(id)a3 date:(id)a4 osVersion:(id)a5;
@end

@implementation GEOConfigStorageExpiryCached

- (BOOL)getConfigKeyIsExpired:(id)a3
{
  v3 = [(GEOConfigStorageExpiryCached *)self _expiryForKey:a3];
  char v4 = [v3 isExpired];

  return v4;
}

- (id)_expiryForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = [(NSDictionary *)self->_cachedValues objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)initForSource:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GEOConfigStorageExpiryCached;
  char v4 = [(GEOConfigStorageExpiryCached *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    if ((unint64_t)a3 > 9) {
      uint64_t v6 = 983040;
    }
    else {
      uint64_t v6 = qword_18A6412B8[a3];
    }
    v4->_options = v6;
    v4->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionary];
    cachedValues = v5->_cachedValues;
    v5->_cachedValues = (NSDictionary *)v7;

    [(GEOConfigStorageExpiryCached *)v5 resync];
  }
  return v5;
}

- (void)resync
{
  v3 = +[GEOConfigStorageClient shared];
  unint64_t options = self->_options;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__GEOConfigStorageExpiryCached_resync__block_invoke;
  v5[3] = &unk_1E53F6BE8;
  v5[4] = self;
  [v3 getExpiringKeys:options result:v5];
}

void __38__GEOConfigStorageExpiryCached_resync__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;
  id v6 = v3;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

- (id)getAllExpiringKeys
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_cachedValues;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)getConfigKeyExpiry:(id)a3 date:(id *)a4 osVersion:(id *)a5
{
  id v8 = a3;
  v9 = v8;
  if (!a4 || !a5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: date != ((void *)0) && osVersion != ((void *)0)", v13, 2u);
    }
    goto LABEL_8;
  }
  if (!v8)
  {
LABEL_8:
    BOOL v11 = 0;
    goto LABEL_5;
  }
  objc_super v10 = [(GEOConfigStorageExpiryCached *)self _expiryForKey:v8];
  *a4 = [v10 expireTime];
  *a5 = [v10 expireOSVersion];
  BOOL v11 = v10 != 0;

LABEL_5:
  return v11;
}

- (void)setConfigKeyExpiry:(id)a3 date:(id)a4 osVersion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[GEOConfigStorageClient shared];
  [v11 setConfigKeyExpiry:v10 options:self->_options date:v9 osVersion:v8];
}

- (void)clearConfigKeyExpiry:(id)a3
{
  id v4 = a3;
  id v5 = +[GEOConfigStorageClient shared];
  [v5 setConfigKeyExpiry:v4 options:self->_options date:0 osVersion:0];
}

- (void).cxx_destruct
{
}

@end