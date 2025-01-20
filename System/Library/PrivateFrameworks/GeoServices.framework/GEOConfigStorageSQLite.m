@interface GEOConfigStorageSQLite
- (BOOL)getConfigKeyExpiry:(id)a3 date:(id *)a4 osVersion:(id *)a5;
- (BOOL)getConfigKeyIsExpired:(id)a3;
- (id)_getExpiringKeyForKey:(id)a3;
- (id)_instanceSpecificGetKey:(id)a3;
- (id)_instanceSpecificGetKeyPath:(id)a3;
- (id)getAllExpiringKeys;
- (void)_instanceSpecificSetValue:(id)a3 forKey:(id)a4;
- (void)clearConfigKeyExpiry:(id)a3;
- (void)setConfigKeyExpiry:(id)a3 date:(id)a4 osVersion:(id)a5;
@end

@implementation GEOConfigStorageSQLite

- (id)_instanceSpecificGetKey:(id)a3
{
  return [(GEOConfigPersistence *)self->super._persister defaultForKeyPath:a3];
}

- (BOOL)getConfigKeyIsExpired:(id)a3
{
  v3 = [(GEOConfigStorageSQLite *)self _getExpiringKeyForKey:a3];
  char v4 = [v3 isExpired];

  return v4;
}

- (id)_getExpiringKeyForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(GEOConfigPersistence *)self->super._persister getExpireForKeyPath:v4];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: key.length > 0", v7, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (id)_instanceSpecificGetKeyPath:(id)a3
{
  return [(GEOConfigPersistence *)self->super._persister defaultForKeyPathComponents:a3];
}

- (id)getAllExpiringKeys
{
  return [(GEOConfigPersistence *)self->super._persister getAllExpiringKeys];
}

- (void)_instanceSpecificSetValue:(id)a3 forKey:(id)a4
{
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
  v10 = [(GEOConfigStorageSQLite *)self _getExpiringKeyForKey:v8];
  *a4 = [v10 expireTime];
  *a5 = [v10 expireOSVersion];
  BOOL v11 = v10 != 0;

LABEL_5:
  return v11;
}

- (void)setConfigKeyExpiry:(id)a3 date:(id)a4 osVersion:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    if (v9 || [v10 length])
    {
      persister = self->super._persister;
      v12 = +[GEOConfigExpiringKey expiringKey:v8 withTime:v9 osVersion:v10];
      [(GEOConfigPersistence *)persister setExpire:v12];
    }
    else
    {
      [(GEOConfigPersistence *)self->super._persister clearExpirationForKeyPath:v8];
    }
    v15[0] = v8;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    _GEOConfigPostKeyExpirysChangedNotificationSource(v13, self->super._source);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: key.length > 0", v14, 2u);
  }
}

- (void)clearConfigKeyExpiry:(id)a3
{
}

@end