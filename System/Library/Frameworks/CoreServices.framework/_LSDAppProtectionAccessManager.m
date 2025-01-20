@interface _LSDAppProtectionAccessManager
+ (id)sharedInstance;
- (_LSDAppProtectionAccessManager)init;
- (id)readFromDBWithError:(id *)a3;
- (id)writeToDB:(id)a3;
@end

@implementation _LSDAppProtectionAccessManager

- (_LSDAppProtectionAccessManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)_LSDAppProtectionAccessManager;
  result = [(_LSDAppProtectionAccessManager *)&v3 init];
  if (result) {
    result->_dbLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)sharedInstance
{
  if (+[_LSDAppProtectionAccessManager sharedInstance]::onceToken != -1) {
    dispatch_once(&+[_LSDAppProtectionAccessManager sharedInstance]::onceToken, &__block_literal_global_7);
  }
  v2 = (void *)+[_LSDAppProtectionAccessManager sharedInstance]::sharedInstance;

  return v2;
}

- (id)readFromDBWithError:(id *)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  p_dbLock = &self->_dbLock;
  os_unfair_lock_lock(&self->_dbLock);
  cache = self->_cache;
  if (!cache)
  {
    v23[0] = @"hiddenBundleIDs";
    v23[1] = @"lockedBundleIDs";
    v24[0] = MEMORY[0x1E4F1CBF0];
    v24[1] = MEMORY[0x1E4F1CBF0];
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v8 = self->_cache;
    self->_cache = v7;

    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v10 = [(id)__LSDefaultsGetSharedInstance() appProtectionStoreFileURL];
    v11 = [v10 path];
    char v12 = [v9 fileExistsAtPath:v11];

    if ((v12 & 1) == 0)
    {
      v13 = _LSAppProtectionLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[_LSDAppProtectionAccessManager readFromDBWithError:](v13);
      }

      v14 = self->_cache;
      v15 = [(id)__LSDefaultsGetSharedInstance() appProtectionStoreFileURL];
      [(NSDictionary *)v14 writeToURL:v15 error:a3];
    }
    v16 = (void *)MEMORY[0x1E4F1C9E8];
    v17 = [(id)__LSDefaultsGetSharedInstance() appProtectionStoreFileURL];
    uint64_t v18 = [v16 dictionaryWithContentsOfURL:v17 error:a3];
    v20 = self->_cache;
    p_cache = &self->_cache;
    *p_cache = (NSDictionary *)v18;

    cache = *p_cache;
  }
  v21 = (void *)[(NSDictionary *)cache copy];
  os_unfair_lock_unlock(p_dbLock);

  return v21;
}

- (id)writeToDB:(id)a3
{
  id v4 = a3;
  p_dbLock = &self->_dbLock;
  os_unfair_lock_lock(&self->_dbLock);
  v6 = (NSDictionary *)[v4 copy];
  cache = self->_cache;
  self->_cache = v6;

  v8 = self->_cache;
  v9 = [(id)__LSDefaultsGetSharedInstance() appProtectionStoreFileURL];
  id v12 = 0;
  [(NSDictionary *)v8 writeToURL:v9 error:&v12];
  id v10 = v12;

  os_unfair_lock_unlock(p_dbLock);

  return v10;
}

- (void).cxx_destruct
{
}

- (void)readFromDBWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_182959000, log, OS_LOG_TYPE_DEBUG, "appProtectionStore does not exist, creating...", v1, 2u);
}

@end