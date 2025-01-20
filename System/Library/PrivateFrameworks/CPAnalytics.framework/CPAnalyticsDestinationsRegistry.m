@interface CPAnalyticsDestinationsRegistry
- (CPAnalyticsDestinationsRegistry)init;
- (NSArray)destinations;
- (id)_destinationClassMap;
- (id)_readConfiguration:(id)a3;
- (void)_parseDestinationsFromConfig:(id)a3 cpAnalyticsInstance:(id)a4;
- (void)addDestination:(id)a3;
- (void)removeDestination:(id)a3;
- (void)removePhotoLibraryFromDestinations;
- (void)sendToAllDestinations:(id)a3;
- (void)setupWithConfigurationAtURL:(id)a3 cpAnalyticsInstance:(id)a4;
- (void)updateWithConfigurationAtURL:(id)a3 cpAnalyticsInstance:(id)a4;
@end

@implementation CPAnalyticsDestinationsRegistry

- (CPAnalyticsDestinationsRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)CPAnalyticsDestinationsRegistry;
  v2 = [(CPAnalyticsDestinationsRegistry *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    destinations = v2->_destinations;
    v2->_destinations = v3;
  }
  return v2;
}

- (void)_parseDestinationsFromConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v30 = a4;
  v28 = v5;
  if (v5)
  {
    v27 = [v5 objectForKey:@"destinations"];
    objc_super v6 = v27;
    if (v27)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = self->_destinations;
        objc_sync_enter(v7);
        v8 = [(CPAnalyticsDestinationsRegistry *)self destinations];
        v31 = (void *)[v8 copy];

        objc_sync_exit(v7);
        v32 = [(CPAnalyticsDestinationsRegistry *)self _destinationClassMap];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v9 = v27;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
        if (!v10) {
          goto LABEL_38;
        }
        uint64_t v11 = *(void *)v39;
        while (1)
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v39 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v38 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [v13 objectForKey:@"enabled"];
              int v15 = [v14 BOOLValue];

              if (v15)
              {
                v16 = [v13 objectForKey:@"name"];
                v17 = [v13 objectForKey:@"config"];
                uint64_t v34 = 0;
                v35 = &v34;
                uint64_t v36 = 0x2050000000;
                uint64_t v37 = 0;
                uint64_t v37 = [v32 objectForKey:v16];
                if (!v35[3])
                {
                  v20 = CPAnalyticsLog();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v43 = v16;
                    _os_log_error_impl(&dword_215355000, v20, OS_LOG_TYPE_ERROR, "Error parsing CPAnalytics config file: destination name '%@' not found in mapping.", buf, 0xCu);
                  }
                  goto LABEL_32;
                }
                v33[0] = MEMORY[0x263EF8330];
                v33[1] = 3221225472;
                v33[2] = __84__CPAnalyticsDestinationsRegistry__parseDestinationsFromConfig_cpAnalyticsInstance___block_invoke;
                v33[3] = &unk_26423C4A0;
                v33[4] = &v34;
                uint64_t v18 = [v31 indexOfObjectPassingTest:v33];
                if (v18 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v19 = [objc_alloc((Class)v35[3]) initWithConfig:v17 cpAnalyticsInstance:v30];
                  v20 = v19;
                  if (v19)
                  {
                    if ([v19 conformsToProtocol:&unk_26C5F59E8])
                    {
                      if ((objc_opt_respondsToSelector() & 1) != 0
                        && [v20 disabled])
                      {
                        v21 = CPAnalyticsLog();
                        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                        {
                          v22 = objc_opt_class();
                          *(_DWORD *)buf = 138412290;
                          v43 = v22;
                          id v26 = v22;
                          _os_log_impl(&dword_215355000, v21, OS_LOG_TYPE_INFO, "Destination %@ class is disabled.", buf, 0xCu);
                        }
                        goto LABEL_26;
                      }
                      -[CPAnalyticsDestinationsRegistry addDestination:](self, "addDestination:", v20, v26);
LABEL_32:

                      _Block_object_dispose(&v34, 8);
                      goto LABEL_33;
                    }
                    v21 = CPAnalyticsLog();
                    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_26;
                    }
                    *(_DWORD *)buf = 138412290;
                    v43 = v16;
                    v23 = v21;
                    v24 = "Destination %@ class does not conform to CPAnalyticsDestination protocol.";
                  }
                  else
                  {
                    v21 = CPAnalyticsLog();
                    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_26;
                    }
                    *(_DWORD *)buf = 138412290;
                    v43 = v16;
                    v23 = v21;
                    v24 = "Error initializing %@ destination in CPAnalytics";
                  }
                  _os_log_error_impl(&dword_215355000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
                  goto LABEL_26;
                }
                v20 = [v31 objectAtIndexedSubscript:v18];
                if (objc_opt_respondsToSelector())
                {
                  [v20 updateWithConfig:v17];
                  v21 = CPAnalyticsLog();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v43 = v16;
                    _os_log_impl(&dword_215355000, v21, OS_LOG_TYPE_INFO, "Updated %@ destination", buf, 0xCu);
                  }
                }
                else
                {
                  v21 = CPAnalyticsLog();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v43 = v16;
                    _os_log_error_impl(&dword_215355000, v21, OS_LOG_TYPE_ERROR, "Cannot update %@ destination. Missing updateWithConfig selector.", buf, 0xCu);
                  }
                }
LABEL_26:

                goto LABEL_32;
              }
            }
LABEL_33:
            ++v12;
          }
          while (v10 != v12);
          uint64_t v25 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
          uint64_t v10 = v25;
          if (!v25)
          {
LABEL_38:

            objc_super v6 = v27;
            break;
          }
        }
      }
    }
  }
}

- (void).cxx_destruct
{
}

- (id)_destinationClassMap
{
  v5[8] = *MEMORY[0x263EF8340];
  v4[0] = @"devLogging";
  v5[0] = objc_opt_class();
  v4[1] = @"metricsDestination";
  v5[1] = objc_opt_class();
  v4[2] = @"signpost";
  v5[2] = objc_opt_class();
  v4[3] = @"appState";
  v5[3] = objc_opt_class();
  v4[4] = @"knowledgeStore";
  v5[4] = objc_opt_class();
  v4[5] = @"interval";
  v5[5] = objc_opt_class();
  v4[6] = @"log";
  v5[6] = objc_opt_class();
  v4[7] = @"biome";
  v5[7] = objc_opt_class();
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];
  return v2;
}

uint64_t __84__CPAnalyticsDestinationsRegistry__parseDestinationsFromConfig_cpAnalyticsInstance___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)_readConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v3 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfURL:");
    if (v3)
    {
      id v9 = 0;
      v4 = [MEMORY[0x263F08900] JSONObjectWithData:v3 options:0 error:&v9];
      id v5 = v9;
      if (v5)
      {
        objc_super v6 = CPAnalyticsLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v11 = v5;
          _os_log_error_impl(&dword_215355000, v6, OS_LOG_TYPE_ERROR, "Error parsing CPAnalytics config file: %@", buf, 0xCu);
        }

        id v7 = 0;
      }
      else
      {
        id v7 = v4;
      }
    }
    else
    {
      id v5 = CPAnalyticsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215355000, v5, OS_LOG_TYPE_ERROR, "Error reading CPAnalytics config file", buf, 2u);
      }
      id v7 = 0;
    }
  }
  else
  {
    v3 = CPAnalyticsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215355000, v3, OS_LOG_TYPE_ERROR, "Error reading CPAnalytics config: nil", buf, 2u);
    }
    id v7 = 0;
  }

  return v7;
}

- (NSArray)destinations
{
  return (NSArray *)self->_destinations;
}

- (void)removePhotoLibraryFromDestinations
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = self->_destinations;
  objc_sync_enter(v3);
  v4 = [(CPAnalyticsDestinationsRegistry *)self destinations];
  id v5 = (void *)[v4 copy];

  objc_sync_exit(v3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "setPhotoLibrary:", 0, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)sendToAllDestinations:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self->_destinations;
  objc_sync_enter(v5);
  id v6 = [(CPAnalyticsDestinationsRegistry *)self destinations];
  uint64_t v7 = (void *)[v6 copy];

  objc_sync_exit(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "processEvent:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)removeDestination:(id)a3
{
  id v5 = a3;
  id v4 = self->_destinations;
  objc_sync_enter(v4);
  [(NSMutableArray *)self->_destinations removeObject:v5];
  objc_sync_exit(v4);
}

- (void)addDestination:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self->_destinations;
    objc_sync_enter(v5);
    [(NSMutableArray *)self->_destinations addObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)updateWithConfigurationAtURL:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v6 = a4;
  id v7 = [(CPAnalyticsDestinationsRegistry *)self _readConfiguration:a3];
  [(CPAnalyticsDestinationsRegistry *)self _parseDestinationsFromConfig:v7 cpAnalyticsInstance:v6];
}

- (void)setupWithConfigurationAtURL:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self->_destinations;
  objc_sync_enter(v7);
  [(NSMutableArray *)self->_destinations removeAllObjects];
  objc_sync_exit(v7);

  [(CPAnalyticsDestinationsRegistry *)self updateWithConfigurationAtURL:v8 cpAnalyticsInstance:v6];
}

@end