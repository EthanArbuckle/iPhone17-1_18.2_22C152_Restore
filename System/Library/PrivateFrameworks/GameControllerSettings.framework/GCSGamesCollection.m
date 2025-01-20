@interface GCSGamesCollection
- (BOOL)storeVersionIsCompatible;
- (GCSGamesCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4;
- (GCSSettingsStoreService)settingsStore;
- (NSArray)values;
- (id)gameWithBundleIdentifier:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setValues:(id)a3;
- (void)updateGames:(id)a3;
@end

@implementation GCSGamesCollection

- (GCSGamesCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GCSGamesCollection;
  v8 = [(GCSGamesCollection *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_settingsStore, v6);
    objc_storeStrong((id *)&v9->_userDefaults, a4);
    v10 = +[GCSGame defaultGame];
    v18 = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:&v18 count:1];
    values = v9->_values;
    v9->_values = (NSArray *)v11;

    [(GCUserDefaults *)v9->_userDefaults addObserver:v9 forKeyPath:@"games" options:5 context:0];
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

- (id)gameWithBundleIdentifier:(id)a3
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
        v10 = objc_msgSend(v9, "bundleIdentifier", (void)v13);
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

- (void)updateGames:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(GCSGamesCollection *)self storeVersionIsCompatible])
  {
    v5 = [v4 objectForKeyedSubscript:@"data"];
    if (v5)
    {
      id v22 = v4;
      id v6 = objc_msgSend(objc_alloc((Class)&off_26D32C908), "initWithCapacity:", -[NSObject count](v5, "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v5 = v5;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v24;
        do
        {
          v10 = v5;
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v10);
            }
            v12 = [[GCSGame alloc] initWithJSONObject:*(void *)(*((void *)&v23 + 1) + 8 * i)];
            long long v13 = [(GCSGame *)v12 bundleIdentifier];
            long long v14 = +[GCSGame defaultIdentifier];
            int v15 = [v13 isEqualToString:v14];

            if (v15) {
              objc_storeStrong((id *)&self->_defaultGame, v12);
            }
            [v6 addObject:v12];
          }
          v5 = v10;
          uint64_t v8 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v8);
      }

      [(GCSGamesCollection *)self setValues:v6];
      long long v16 = getGCSLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_super v17 = [(GCSGamesCollection *)self values];
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        _os_log_impl(&dword_22128F000, v16, OS_LOG_TYPE_INFO, "GCSGamesCollection.values = %@", buf, 0xCu);
      }
      id v4 = v22;
    }
  }
  else
  {
    v18 = +[GCSGame defaultGame];
    defaultGame = self->_defaultGame;
    self->_defaultGame = v18;

    v30 = self->_defaultGame;
    v20 = +[NSArray arrayWithObjects:&v30 count:1];
    [(GCSGamesCollection *)self setValues:v20];

    v5 = getGCSLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v21 = [(GCSGamesCollection *)self values];
      *(_DWORD *)buf = 138412290;
      v29 = v21;
      _os_log_impl(&dword_22128F000, v5, OS_LOG_TYPE_INFO, "GCSGamesCollection.values = %@", buf, 0xCu);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"games"])
  {
    uint64_t v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  }
  else
  {
    if (![v10 isEqualToString:@"settingsVersion"])
    {
      v15.receiver = self;
      v15.super_class = (Class)GCSGamesCollection;
      [(GCSGamesCollection *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
      goto LABEL_7;
    }
    uint64_t v13 = [(GCUserDefaults *)self->_userDefaults objectForKey:@"games"];
  }
  long long v14 = (void *)v13;
  [(GCSGamesCollection *)self updateGames:v13];

LABEL_7:
}

- (void)dealloc
{
  [(GCUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"games" context:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_settingsStore);
    [v5 removeObserver:self forKeyPath:@"settingsVersion" context:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)GCSGamesCollection;
  [(GCSGamesCollection *)&v6 dealloc];
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
  objc_storeStrong((id *)&self->_defaultGame, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end