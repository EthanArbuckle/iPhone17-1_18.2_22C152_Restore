@interface GCSProfilesCollection
- (BOOL)storeVersionIsCompatible;
- (GCSProfilesCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4;
- (GCSSettingsStoreService)settingsStore;
- (NSArray)values;
- (id)profileForIdentifier:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setValues:(id)a3;
- (void)updateProfiles:(id)a3;
@end

@implementation GCSProfilesCollection

- (GCSProfilesCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GCSProfilesCollection;
  v8 = [(GCSProfilesCollection *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_settingsStore, v6);
    objc_storeStrong((id *)&v9->_userDefaults, a4);
    v10 = +[GCSProfile defaultProfile];
    v18 = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:&v18 count:1];
    values = v9->_values;
    v9->_values = (NSArray *)v11;

    [(GCUserDefaults *)v9->_userDefaults addObserver:v9 forKeyPath:@"profiles" options:5 context:0];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_settingsStore);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v15 = objc_loadWeakRetained((id *)&v9->_settingsStore);
      [v15 addObserver:v9 forKeyPath:@"settingsVersion" options:5 context:0];
    }
  }

  return v9;
}

- (BOOL)storeVersionIsCompatible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  char v3 = [WeakRetained savedDataMeetsRequiredVersion:@"10.1.21"];

  return v3;
}

- (id)profileForIdentifier:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_values;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "uuid", (void)v15);
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v13 = v10;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v13 = +[GCSProfile defaultProfile];
LABEL_11:

  return v13;
}

- (void)updateProfiles:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(GCSProfilesCollection *)self storeVersionIsCompatible])
  {
    v5 = [v4 objectForKeyedSubscript:@"data"];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(objc_alloc((Class)&off_26D32C908), "initWithCapacity:", -[NSObject count](v5, "count"));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v5 = v5;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v20;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v5);
            }
            uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
            char v12 = [GCSProfile alloc];
            id v13 = -[GCSProfile initWithJSONObject:](v12, "initWithJSONObject:", v11, (void)v19);
            [v6 addObject:v13];

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v8);
      }

      [(GCSProfilesCollection *)self setValues:v6];
      v14 = getGCSLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        long long v15 = [(GCSProfilesCollection *)self values];
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        _os_log_impl(&dword_22128F000, v14, OS_LOG_TYPE_INFO, "GCSProfilesCollection.values = %@", buf, 0xCu);
      }
    }
  }
  else
  {
    long long v16 = +[GCSProfile defaultProfile];
    v26 = v16;
    long long v17 = +[NSArray arrayWithObjects:&v26 count:1];
    [(GCSProfilesCollection *)self setValues:v17];

    v5 = getGCSLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      long long v18 = [(GCSProfilesCollection *)self values];
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl(&dword_22128F000, v5, OS_LOG_TYPE_INFO, "GCSProfilesCollection.values = %@", buf, 0xCu);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"profiles"])
  {
    uint64_t v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  }
  else
  {
    if (![v10 isEqualToString:@"settingsVersion"])
    {
      v15.receiver = self;
      v15.super_class = (Class)GCSProfilesCollection;
      [(GCSProfilesCollection *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
      goto LABEL_7;
    }
    uint64_t v13 = [(GCUserDefaults *)self->_userDefaults objectForKey:@"profiles"];
  }
  v14 = (void *)v13;
  [(GCSProfilesCollection *)self updateProfiles:v13];

LABEL_7:
}

- (void)dealloc
{
  [(GCUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"profiles" context:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_settingsStore);
    [v5 removeObserver:self forKeyPath:@"settingsVersion" context:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)GCSProfilesCollection;
  [(GCSProfilesCollection *)&v6 dealloc];
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (GCSSettingsStoreService)settingsStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  return (GCSSettingsStoreService *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsStore);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end