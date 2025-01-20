@interface GCSControllersCollection
- (BOOL)storeVersionIsCompatible;
- (GCSControllersCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4;
- (GCSSettingsStoreService)settingsStore;
- (NSArray)values;
- (id)controllerForPersistentIdentifier:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setValues:(id)a3;
- (void)updateControllers:(id)a3;
@end

@implementation GCSControllersCollection

- (GCSControllersCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GCSControllersCollection;
  v8 = [(GCSControllersCollection *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_settingsStore, v6);
    objc_storeStrong((id *)&v9->_userDefaults, a4);
    [(GCUserDefaults *)v9->_userDefaults addObserver:v9 forKeyPath:@"controllers" options:5 context:0];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_settingsStore);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v12 = objc_loadWeakRetained((id *)&v9->_settingsStore);
      [v12 addObserver:v9 forKeyPath:@"settingsVersion" options:5 context:0];
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

- (id)controllerForPersistentIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_values;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "persistentIdentifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateControllers:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(GCSControllersCollection *)self storeVersionIsCompatible])
  {
    v5 = [v4 objectForKeyedSubscript:@"data"];
    if (v5)
    {
      id v6 = objc_msgSend(objc_alloc((Class)&off_26D32C908), "initWithCapacity:", -[NSObject count](v5, "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v5 = v5;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v5);
            }
            uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
            id v12 = [GCSController alloc];
            long long v13 = -[GCSController initWithJSONObject:](v12, "initWithJSONObject:", v11, (void)v17);
            [v6 addObject:v13];

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v8);
      }

      [(GCSControllersCollection *)self setValues:v6];
      long long v14 = getGCSLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        long long v15 = [(GCSControllersCollection *)self values];
        *(_DWORD *)buf = 138412290;
        v23 = v15;
        _os_log_impl(&dword_22128F000, v14, OS_LOG_TYPE_INFO, "GCSControllersCollection.values = %@", buf, 0xCu);
      }
    }
  }
  else
  {
    [(GCSControllersCollection *)self setValues:&__NSArray0__struct];
    v5 = getGCSLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      long long v16 = [(GCSControllersCollection *)self values];
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_22128F000, v5, OS_LOG_TYPE_INFO, "GCSControllersCollection.values = %@", buf, 0xCu);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"controllers"])
  {
    uint64_t v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  }
  else
  {
    if (![v10 isEqualToString:@"settingsVersion"])
    {
      v15.receiver = self;
      v15.super_class = (Class)GCSControllersCollection;
      [(GCSControllersCollection *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
      goto LABEL_7;
    }
    uint64_t v13 = [(GCUserDefaults *)self->_userDefaults objectForKey:@"controllers"];
  }
  long long v14 = (void *)v13;
  [(GCSControllersCollection *)self updateControllers:v13];

LABEL_7:
}

- (void)dealloc
{
  [(GCUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"controllers" context:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_settingsStore);
    [v5 removeObserver:self forKeyPath:@"settingsVersion" context:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)GCSControllersCollection;
  [(GCSControllersCollection *)&v6 dealloc];
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