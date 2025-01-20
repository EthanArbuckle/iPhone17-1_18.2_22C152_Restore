@interface GCSCopilotFusedControllersCollection
- (BOOL)storeVersionIsCompatible;
- (GCSCopilotFusedControllersCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4;
- (GCSSettingsStoreService)settingsStore;
- (NSArray)values;
- (id)_unitTest_fusePilotController:(id)a3 withCopilot:(id)a4;
- (id)copilotFusedControllerForControllerIdentifier:(id)a3;
- (id)copilotFusedControllerForCopilotControllerIdentifier:(id)a3;
- (id)copilotFusedControllerForFusedControllerIdentifier:(id)a3;
- (id)copilotFusedControllerForPilotControllerIdentifier:(id)a3;
- (void)_unitTest_saveCopilotFusedControllers:(id)a3;
- (void)_unitTest_unfuseCopilotFusedController:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setValues:(id)a3;
- (void)updateCopilotFusedControllers:(id)a3;
@end

@implementation GCSCopilotFusedControllersCollection

- (GCSCopilotFusedControllersCollection)initWithSettingsStore:(id)a3 userDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GCSCopilotFusedControllersCollection;
  v8 = [(GCSCopilotFusedControllersCollection *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_settingsStore, v6);
    objc_storeStrong((id *)&v9->_userDefaults, a4);
    [(GCUserDefaults *)v9->_userDefaults addObserver:v9 forKeyPath:@"copilotFusedControllers" options:5 context:0];
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

- (id)copilotFusedControllerForControllerIdentifier:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_values;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "fusedControllerIdentifier", (void)v17);
        if ([v11 isEqualToString:v4]) {
          goto LABEL_14;
        }
        id v12 = [v10 pilotIdentifier];
        if ([v12 isEqualToString:v4])
        {

LABEL_14:
LABEL_15:
          id v15 = v10;
          goto LABEL_16;
        }
        v13 = [v10 copilotIdentifier];
        char v14 = [v13 isEqualToString:v4];

        if (v14) {
          goto LABEL_15;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v15 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v15 = 0;
  }
LABEL_16:

  return v15;
}

- (id)copilotFusedControllerForFusedControllerIdentifier:(id)a3
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
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "fusedControllerIdentifier", (void)v13);
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

- (id)copilotFusedControllerForPilotControllerIdentifier:(id)a3
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
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "pilotIdentifier", (void)v13);
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

- (id)copilotFusedControllerForCopilotControllerIdentifier:(id)a3
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
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "copilotIdentifier", (void)v13);
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

- (void)updateCopilotFusedControllers:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(GCSCopilotFusedControllersCollection *)self storeVersionIsCompatible])
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
            id v12 = [GCSCopilotFusedController alloc];
            long long v13 = -[GCSCopilotFusedController initWithJSONObject:](v12, "initWithJSONObject:", v11, (void)v17);
            [v6 addObject:v13];

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v8);
      }

      [(GCSCopilotFusedControllersCollection *)self setValues:v6];
      long long v14 = getGCSLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        long long v15 = [(GCSCopilotFusedControllersCollection *)self values];
        *(_DWORD *)buf = 138412290;
        v23 = v15;
        _os_log_impl(&dword_22128F000, v14, OS_LOG_TYPE_INFO, "GCSCopilotFusedControllersCollection.values = %@", buf, 0xCu);
      }
    }
  }
  else
  {
    [(GCSCopilotFusedControllersCollection *)self setValues:&__NSArray0__struct];
    v5 = getGCSLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      long long v16 = [(GCSCopilotFusedControllersCollection *)self values];
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_22128F000, v5, OS_LOG_TYPE_INFO, "GCSCopilotFusedControllersCollection.values = %@", buf, 0xCu);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"copilotFusedControllers"])
  {
    uint64_t v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  }
  else
  {
    if (![v10 isEqualToString:@"settingsVersion"])
    {
      v15.receiver = self;
      v15.super_class = (Class)GCSCopilotFusedControllersCollection;
      [(GCSCopilotFusedControllersCollection *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
      goto LABEL_7;
    }
    uint64_t v13 = [(GCUserDefaults *)self->_userDefaults objectForKey:@"copilotFusedControllers"];
  }
  long long v14 = (void *)v13;
  [(GCSCopilotFusedControllersCollection *)self updateCopilotFusedControllers:v13];

LABEL_7:
}

- (void)dealloc
{
  [(GCUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"copilotFusedControllers" context:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsStore);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_settingsStore);
    [v5 removeObserver:self forKeyPath:@"settingsVersion" context:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)GCSCopilotFusedControllersCollection;
  [(GCSCopilotFusedControllersCollection *)&v6 dealloc];
}

- (id)_unitTest_fusePilotController:(id)a3 withCopilot:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(GCSCopilotFusedControllersCollection *)self copilotFusedControllerForControllerIdentifier:v8];

  if (v9)
  {
    long long v20 = unk_26D32CE78(&off_26D32D018, "currentHandler");
    [v20 handleFailureInMethod:a2 object:self file:@"GCSCopilotFusedControllersCollection.m" lineNumber:134 description:@"The pilot controller is already fused to another controller"];
  }
  id v10 = [(GCSCopilotFusedControllersCollection *)self copilotFusedControllerForControllerIdentifier:v7];

  if (v10)
  {
    v21 = unk_26D32CE78(&off_26D32D018, "currentHandler");
    [v21 handleFailureInMethod:a2 object:self file:@"GCSCopilotFusedControllersCollection.m" lineNumber:135 description:@"The copilot controller is already fused to another controller"];
  }
  id v11 = +[NSUUID UUID];
  id v12 = [v11 UUIDString];

  uint64_t v13 = [[GCSCopilotFusedController alloc] initWithFusedControllerIdentifier:v12 pilotIdentifier:v8 copilotIdentifier:v7];
  values = self->_values;
  if (values) {
    objc_super v15 = (NSArray *)[(NSArray *)values mutableCopy];
  }
  else {
    objc_super v15 = (NSArray *)objc_opt_new();
  }
  long long v16 = v15;
  [(NSArray *)v15 addObject:v13];
  long long v17 = self->_values;
  self->_values = v16;
  long long v18 = v16;

  [(GCSCopilotFusedControllersCollection *)self _unitTest_saveCopilotFusedControllers:v18];
  return v12;
}

- (void)_unitTest_unfuseCopilotFusedController:(id)a3
{
  id v11 = [(GCSCopilotFusedControllersCollection *)self copilotFusedControllerForControllerIdentifier:a3];
  if (!v11)
  {
    id v10 = unk_26D32CE78(&off_26D32D018, "currentHandler");
    [v10 handleFailureInMethod:a2 object:self file:@"GCSCopilotFusedControllersCollection.m" lineNumber:151 description:@"The copilot fused controller does not exist"];
  }
  values = self->_values;
  if (values) {
    objc_super v6 = (NSArray *)[(NSArray *)values mutableCopy];
  }
  else {
    objc_super v6 = (NSArray *)objc_opt_new();
  }
  id v7 = v6;
  [(NSArray *)v6 removeObject:v11];
  id v8 = self->_values;
  self->_values = v7;
  uint64_t v9 = v7;

  [(GCSCopilotFusedControllersCollection *)self _unitTest_saveCopilotFusedControllers:v9];
}

- (void)_unitTest_saveCopilotFusedControllers:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "jsonObject", (void)v16);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }

  v20[0] = @"data";
  v20[1] = @"tombstones";
  v21[0] = v5;
  uint64_t v12 = -[GCUserDefaults objectForKey:](self->_userDefaults, "objectForKey:");
  uint64_t v13 = (void *)v12;
  long long v14 = &__NSArray0__struct;
  if (v12) {
    long long v14 = (void *)v12;
  }
  v21[1] = v14;
  objc_super v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_26D32B850, "dictionaryWithObjects:forKeys:count:", v21, v20, 2, (void)v16);

  [(GCUserDefaults *)self->_userDefaults setObject:@"10.1.21" forKey:@"settingsVersion"];
  [(GCUserDefaults *)self->_userDefaults setObject:v15 forKey:@"copilotFusedControllers"];
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