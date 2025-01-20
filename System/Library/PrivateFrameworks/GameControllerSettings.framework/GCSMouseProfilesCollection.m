@interface GCSMouseProfilesCollection
- (BOOL)storeVersionIsCompatible;
- (GCSMouseProfilesCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4;
- (GCSSettingsStoreService)settingsStore;
- (NSArray)values;
- (id)mouseProfileForBundleIdentifier:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setValues:(id)a3;
- (void)updateMouseProfiles:(id)a3;
@end

@implementation GCSMouseProfilesCollection

- (GCSMouseProfilesCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GCSMouseProfilesCollection;
  v8 = [(GCSMouseProfilesCollection *)&v13 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    values = v8->_values;
    v8->_values = (NSArray *)v9;

    id v11 = objc_storeWeak((id *)&v8->_settingsStore, v6);
    [v6 addObserver:v8 forKeyPath:@"mouseProfiles" options:5 context:KVOContext];

    objc_storeStrong((id *)&v8->_userDefaults, a4);
    [(GCUserDefaults *)v8->_userDefaults addObserver:v8 forKeyPath:@"settingsVersion" options:5 context:KVOContext];
  }

  return v8;
}

- (void)dealloc
{
  [(GCUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"settingsVersion" context:KVOContext];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  [WeakRetained removeObserver:self forKeyPath:@"mouseProfiles" context:KVOContext];

  v4.receiver = self;
  v4.super_class = (Class)GCSMouseProfilesCollection;
  [(GCSMouseProfilesCollection *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11 = a3;
  v12 = (GCUserDefaults *)a4;
  id v13 = a5;
  if ((void *)KVOContext == a6)
  {
    id WeakRetained = (GCUserDefaults *)objc_loadWeakRetained((id *)&self->_settingsStore);

    if (WeakRetained == v12)
    {
      if (([v11 isEqualToString:@"mouseProfiles"] & 1) == 0)
      {
        v18 = unk_26D32CE78(&off_26D32D018, "currentHandler");
        [v18 handleFailureInMethod:a2, self, @"GCSMouseProfilesCollection.m", 52, @"Unhandled keypath %@", v11 object file lineNumber description];
      }
      uint64_t v15 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    }
    else
    {
      if (self->_userDefaults != v12)
      {
        v19 = +[NSString stringWithFormat:@"KVO notification from unknown object <%@:%p>", objc_opt_class(), v12];
        id v20 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v19 userInfo:0];

        objc_exception_throw(v20);
      }
      if (([v11 isEqualToString:@"settingsVersion"] & 1) == 0)
      {
        v17 = unk_26D32CE78(&off_26D32D018, "currentHandler");
        [v17 handleFailureInMethod:a2, self, @"GCSMouseProfilesCollection.m", 55, @"Unhandled keypath %@", v11 object file lineNumber description];
      }
      uint64_t v15 = [(GCUserDefaults *)self->_userDefaults objectForKey:@"mouseProfiles"];
    }
    v16 = (void *)v15;
    [(GCSMouseProfilesCollection *)self updateMouseProfiles:v15];
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)GCSMouseProfilesCollection;
    [(GCSMouseProfilesCollection *)&v21 observeValueForKeyPath:v11 ofObject:v12 change:v13 context:a6];
  }
}

- (BOOL)storeVersionIsCompatible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  char v3 = [WeakRetained savedDataMeetsRequiredVersion:@"10.1.21"];

  return v3;
}

- (void)updateMouseProfiles:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(GCSMouseProfilesCollection *)self storeVersionIsCompatible])
  {
    v5 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
          v12 = [GCSMouseProfile alloc];
          id v13 = -[GCSMouseProfile initWithJSONObject:](v12, "initWithJSONObject:", v11, (void)v14);
          if (v13) {
            [v5 addObject:v13];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [(GCSMouseProfilesCollection *)self setValues:v5];
  }
  else
  {
    [(GCSMouseProfilesCollection *)self setValues:&__NSArray0__struct];
  }
}

- (id)mouseProfileForBundleIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(GCSMouseProfilesCollection *)self values];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 bundleIdentifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (GCSSettingsStoreService)settingsStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  return (GCSSettingsStoreService *)WeakRetained;
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_destroyWeak((id *)&self->_settingsStore);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end