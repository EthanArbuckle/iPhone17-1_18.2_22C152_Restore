@interface _GEOConfigStorageLocalHelper
- (_GEOConfigStorageLocalHelper)initWithSource:(int64_t)a3 store:(id)a4 directStore:(id)a5;
- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6;
- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6;
@end

@implementation _GEOConfigStorageLocalHelper

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  if ((a5 & 0x2000) == 0
    || (direct = self->_direct) == 0
    || ([(GEOConfigStorageReadWrite *)direct getConfigValueForKey:v10 countryCode:v11 options:a5 source:a6], (v13 = objc_claimAutoreleasedReturnValue()) == 0)&& (GEOConfig_migrateEntitledKey(v10, a5, self->_direct, (uint64_t)a6), (v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v13 = [(GEOConfigStorageReadWrite *)self->_store getConfigValueForKey:v10 countryCode:v11 options:a5 source:a6];
    if (!v13)
    {
      v13 = GEOConfig_migrateEntitledKey(v10, a5, self->_store, (uint64_t)a6);
    }
  }

  return v13;
}

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
  BOOL v6 = a6;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if ((a5 & 0x2000) != 0)
  {
    direct = self->_direct;
    if (direct)
    {
      _deleteOldEntitledKey(v11, a5, direct);
      if (v10) {
        GEOConfig_createEntitledKeyPathForKey(v12, a5, self->_direct);
      }
      [(GEOConfigStorageReadWrite *)self->_direct setConfigValue:v10 forKey:v12 options:a5 synchronous:v6];
    }
  }
  _deleteOldEntitledKey(v12, a5, self->_store);
  if (v10) {
    GEOConfig_createEntitledKeyPathForKey(v12, a5, self->_store);
  }
  [(GEOConfigStorageReadWrite *)self->_store setConfigValue:v10 forKey:v12 options:a5 synchronous:v6];
  if ((a5 & 0x1000) != 0)
  {
    int64_t source = self->_source;
    if ((unint64_t)(source - 6) >= 3)
    {
      if (source == 2) {
        GEOUserDefaultsTriggerWatchSync(v12);
      }
    }
    else
    {
      notify_post(GEOConfigNeedsWatchSyncDarwinNotification);
    }
  }
  if ([v12 length])
  {
    v16[0] = v12;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    _GEOConfigPostKeysChangedNotification(v15, a5);
  }
}

- (_GEOConfigStorageLocalHelper)initWithSource:(int64_t)a3 store:(id)a4 directStore:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_GEOConfigStorageLocalHelper;
  id v11 = [(_GEOConfigStorageLocalHelper *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_int64_t source = a3;
    objc_storeStrong((id *)&v11->_store, a4);
    objc_storeStrong((id *)&v12->_direct, a5);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_direct, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end