@interface ATUserDefaults
+ (ATUserDefaults)sharedInstance;
+ (id)readOnlyDefaults;
+ (void)synchronize;
- (ATUserDefaults)init;
- (BOOL)hasCompletedDataMigration;
- (NSDictionary)diskUsageInfo;
- (NSNumber)minimumNetworkLinkQualityForDownloads;
- (id)allHosts;
- (id)hostInfoForIdentifier:(id)a3;
- (void)_updateDefaults;
- (void)removeHost:(id)a3;
- (void)setDiskUsageInfo:(id)a3;
- (void)setHasCompletedDataMigration:(BOOL)a3;
- (void)setMinimumNetworkLinkQualityForDownloads:(id)a3;
- (void)updateHostInfo:(id)a3 disabledAssetTypes:(id)a4;
- (void)updateLastSyncWithHostLibrary:(id)a3;
@end

@implementation ATUserDefaults

- (void).cxx_destruct
{
}

- (void)_updateDefaults
{
  _atcStandardDefaults();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [(ATUserDefaults *)self allHosts];
  if (v3) {
    [v5 setObject:v3 forKey:@"Hosts"];
  }
  v4 = [(ATUserDefaults *)self diskUsageInfo];
  if (v4) {
    [v5 setObject:v4 forKey:@"DiskUsage"];
  }
  [(id)objc_opt_class() synchronize];
}

- (void)setMinimumNetworkLinkQualityForDownloads:(id)a3
{
  id v3 = a3;
  _atcStandardDefaults();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v3 forKey:@"MinimumNetworkLinkQualityForDownloads"];
}

- (NSNumber)minimumNetworkLinkQualityForDownloads
{
  v2 = _atcStandardDefaults();
  id v3 = [v2 objectForKey:@"MinimumNetworkLinkQualityForDownloads"];

  return (NSNumber *)v3;
}

- (NSDictionary)diskUsageInfo
{
  id v3 = self->_defaults;
  objc_sync_enter(v3);
  id v4 = [(NSMutableDictionary *)self->_defaults objectForKey:@"DiskUsage"];
  objc_sync_exit(v3);

  return (NSDictionary *)v4;
}

- (void)setDiskUsageInfo:(id)a3
{
  id v7 = a3;
  id v4 = self->_defaults;
  objc_sync_enter(v4);
  defaults = self->_defaults;
  v6 = [v7 deepMutableObject];
  [(NSMutableDictionary *)defaults setObject:v6 forKey:@"DiskUsage"];

  [(ATUserDefaults *)self _updateDefaults];
  objc_sync_exit(v4);
}

- (void)setHasCompletedDataMigration:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self->_defaults;
  objc_sync_enter(obj);
  defaults = self->_defaults;
  v6 = [NSNumber numberWithBool:v3];
  [(NSMutableDictionary *)defaults setObject:v6 forKey:@"DataMigrated"];

  [(ATUserDefaults *)self _updateDefaults];
  objc_sync_exit(obj);
}

- (id)allHosts
{
  BOOL v3 = self->_defaults;
  objc_sync_enter(v3);
  id v4 = [(NSMutableDictionary *)self->_defaults objectForKey:@"Hosts"];
  objc_sync_exit(v3);

  return v4;
}

- (id)hostInfoForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self->_defaults;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)self->_defaults objectForKey:@"Hosts"];
  id v7 = [v6 objectForKey:v4];

  objc_sync_exit(v5);

  return v7;
}

- (void)removeHost:(id)a3
{
  id v6 = a3;
  id v4 = self->_defaults;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)self->_defaults objectForKey:@"Hosts"];
  [v5 removeObjectForKey:v6];

  [(ATUserDefaults *)self _updateDefaults];
  objc_sync_exit(v4);
}

- (void)updateLastSyncWithHostLibrary:(id)a3
{
  id v12 = a3;
  id v4 = self->_defaults;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)self->_defaults objectForKey:@"Hosts"];
  id v6 = [v5 objectForKey:v12];

  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_defaults objectForKey:@"Hosts"];
    v8 = [v7 objectForKey:v12];
    v9 = NSNumber;
    v10 = [MEMORY[0x1E4F1C9C8] date];
    [v10 timeIntervalSinceReferenceDate];
    v11 = objc_msgSend(v9, "numberWithDouble:");
    [v8 setObject:v11 forKey:@"LastSync"];
  }
  [(ATUserDefaults *)self _updateDefaults];
  objc_sync_exit(v4);
}

- (void)updateHostInfo:(id)a3 disabledAssetTypes:(id)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v67 = a4;
  v75 = self;
  v66 = self->_defaults;
  objc_sync_enter(v66);
  v73 = v6;
  id v7 = [v6 objectForKey:@"LibraryID"];

  if (v7)
  {
    v8 = [(NSMutableDictionary *)self->_defaults objectForKey:@"Hosts"];
    v9 = [v6 objectForKey:@"LibraryID"];
    v10 = [v8 objectForKey:v9];
    v11 = v10;
    if (v10)
    {
      id v76 = v10;
    }
    else
    {
      id v76 = [MEMORY[0x1E4F1CA60] dictionary];
    }

    uint64_t v12 = [v73 objectForKey:@"Wakeable"];
    if (v12) {
      [v76 setObject:v12 forKey:@"Wakeable"];
    }
    else {
      [v76 removeObjectForKey:@"Wakeable"];
    }
    v65 = (void *)v12;
    uint64_t v13 = [v73 objectForKey:@"SyncHostName"];
    if (v13) {
      [v76 setObject:v13 forKey:@"SyncHostName"];
    }
    v64 = (void *)v13;
    v14 = [v73 objectForKey:@"SyncedAssetTypes"];
    v68 = [v14 deepMutableObject];

    [v68 removeObjectsInArray:v67];
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    [v76 setObject:v15 forKey:@"SyncedDataclasses"];

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v16 = [v73 objectForKey:@"SyncedDataclasses"];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v89 objects:v96 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v90;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v90 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v89 + 1) + 8 * i);
          v21 = [v76 objectForKey:@"SyncedDataclasses"];
          v22 = [MEMORY[0x1E4F1CA48] array];
          [v21 setObject:v22 forKey:v20];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v89 objects:v96 count:16];
      }
      while (v17);
    }

    if (v68)
    {
      v23 = [v76 objectForKey:@"SyncedDataclasses"];
      [v23 setObject:v68 forKey:@"Media"];
    }
    v24 = [v73 objectForKey:@"LibraryID"];
    [v76 setObject:v24 forKey:@"LibraryID"];

    uint64_t v25 = [v73 objectForKey:@"MacOSVersion"];
    if (v25)
    {
      [v76 setObject:@"MacOS" forKey:@"OSType"];
      [v76 setObject:v25 forKey:@"OSVersion"];
    }
    else
    {
      uint64_t v25 = [v73 objectForKey:@"WindowsOSVersion"];
      if (v25)
      {
        [v76 setObject:@"Windows" forKey:@"OSType"];
        [v76 setObject:v25 forKey:@"OSVersion"];
      }
    }
    v26 = [(NSMutableDictionary *)v75->_defaults objectForKey:@"Hosts"];
    uint64_t v62 = v25;
    BOOL v27 = v26 == 0;

    if (v27)
    {
      defaults = v75->_defaults;
      v29 = objc_opt_new();
      [(NSMutableDictionary *)defaults setObject:v29, @"Hosts", v62 forKey];
    }
    v30 = [(NSMutableDictionary *)v75->_defaults objectForKey:@"Hosts", v62];
    v31 = [v73 objectForKey:@"LibraryID"];
    [v30 setObject:v76 forKey:v31];

    v32 = [v76 objectForKey:@"SyncedDataclasses"];
    v69 = [v32 allKeys];

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v33 = [(NSMutableDictionary *)v75->_defaults objectForKey:@"Hosts"];
    obuint64_t j = [v33 allKeys];

    uint64_t v34 = [obj countByEnumeratingWithState:&v85 objects:v95 count:16];
    if (v34)
    {
      uint64_t v71 = *(void *)v86;
      do
      {
        uint64_t v35 = 0;
        uint64_t v72 = v34;
        do
        {
          if (*(void *)v86 != v71) {
            objc_enumerationMutation(obj);
          }
          uint64_t v74 = v35;
          v36 = *(void **)(*((void *)&v85 + 1) + 8 * v35);
          v37 = [(NSMutableDictionary *)v75->_defaults objectForKey:@"Hosts"];
          v38 = [v37 objectForKey:v36];
          v39 = [v38 objectForKey:@"SyncedDataclasses"];

          v40 = [v73 objectForKey:@"LibraryID"];
          LOBYTE(v36) = [v36 isEqualToString:v40];

          if ((v36 & 1) == 0)
          {
            long long v83 = 0u;
            long long v84 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            id v41 = v69;
            uint64_t v42 = [v41 countByEnumeratingWithState:&v81 objects:v94 count:16];
            if (v42)
            {
              uint64_t v43 = *(void *)v82;
              do
              {
                for (uint64_t j = 0; j != v42; ++j)
                {
                  if (*(void *)v82 != v43) {
                    objc_enumerationMutation(v41);
                  }
                  uint64_t v45 = *(void *)(*((void *)&v81 + 1) + 8 * j);
                  v46 = [v39 objectForKey:v45];

                  if (v46)
                  {
                    v47 = [v76 objectForKey:@"SyncedDataclasses"];
                    v48 = [v47 objectForKey:v45];

                    if (![v48 count]) {
                      goto LABEL_39;
                    }
                    v49 = [v39 objectForKey:v45];
                    [v49 removeObjectsInArray:v48];

                    v50 = [v39 objectForKey:v45];
                    BOOL v51 = [v50 count] == 0;

                    if (v51) {
LABEL_39:
                    }
                      [v39 removeObjectForKey:v45];
                  }
                }
                uint64_t v42 = [v41 countByEnumeratingWithState:&v81 objects:v94 count:16];
              }
              while (v42);
            }
          }
          uint64_t v35 = v74 + 1;
        }
        while (v74 + 1 != v72);
        uint64_t v34 = [obj countByEnumeratingWithState:&v85 objects:v95 count:16];
      }
      while (v34);
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v52 = [(NSMutableDictionary *)v75->_defaults objectForKey:@"Hosts"];
    v53 = [v52 allKeys];

    uint64_t v54 = [v53 countByEnumeratingWithState:&v77 objects:v93 count:16];
    if (v54)
    {
      uint64_t v55 = *(void *)v78;
      do
      {
        for (uint64_t k = 0; k != v54; ++k)
        {
          if (*(void *)v78 != v55) {
            objc_enumerationMutation(v53);
          }
          uint64_t v57 = *(void *)(*((void *)&v77 + 1) + 8 * k);
          v58 = [(NSMutableDictionary *)v75->_defaults objectForKey:@"Hosts"];
          v59 = [v58 objectForKey:v57];
          v60 = [v59 objectForKey:@"SyncedDataclasses"];

          if (![v60 count])
          {
            v61 = [(NSMutableDictionary *)v75->_defaults objectForKey:@"Hosts"];
            [v61 removeObjectForKey:v57];
          }
        }
        uint64_t v54 = [v53 countByEnumeratingWithState:&v77 objects:v93 count:16];
      }
      while (v54);
    }

    [(ATUserDefaults *)v75 _updateDefaults];
  }
  objc_sync_exit(v66);
}

- (BOOL)hasCompletedDataMigration
{
  BOOL v3 = self->_defaults;
  objc_sync_enter(v3);
  id v4 = [(NSMutableDictionary *)self->_defaults objectForKey:@"DataMigrated"];
  if ([v4 BOOLValue])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = _atcStandardDefaults();
    id v7 = [v6 dictionaryRepresentation];
    v8 = [v7 objectForKey:@"DataMigrated"];
    char v5 = [v8 BOOLValue];
  }
  objc_sync_exit(v3);

  return v5;
}

- (ATUserDefaults)init
{
  v11.receiver = self;
  v11.super_class = (Class)ATUserDefaults;
  v2 = [(ATUserDefaults *)&v11 init];
  if (v2)
  {
    BOOL v3 = _airTrafficPersistentDictionary();
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 deepMutableObject];
      defaults = v2->_defaults;
      v2->_defaults = (NSMutableDictionary *)v5;
    }
    else
    {
      id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v8 = v2->_defaults;
      v2->_defaults = v7;

      v9 = v2->_defaults;
      defaults = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)v9 setObject:defaults forKey:@"Hosts"];
    }
  }
  return v2;
}

+ (id)readOnlyDefaults
{
  v2 = _airTrafficPersistentDictionary();
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  uint64_t v5 = v4;

  return v5;
}

+ (void)synchronize
{
}

+ (ATUserDefaults)sharedInstance
{
  if (sharedInstance_onceToken_3152 != -1) {
    dispatch_once(&sharedInstance_onceToken_3152, &__block_literal_global_3153);
  }
  v2 = (void *)sharedInstance___sharedInstance_3154;

  return (ATUserDefaults *)v2;
}

uint64_t __32__ATUserDefaults_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance_3154 = objc_alloc_init(ATUserDefaults);

  return MEMORY[0x1F41817F8]();
}

@end