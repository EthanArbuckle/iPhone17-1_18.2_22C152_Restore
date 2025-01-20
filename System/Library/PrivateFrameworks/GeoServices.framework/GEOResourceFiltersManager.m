@interface GEOResourceFiltersManager
- (GEOResourceFiltersManager)init;
- (GEOResourceFiltersManager)initWithConfiguration:(id)a3;
- (GEOResourceFiltersManagerDelegate)delegate;
- (NSSet)activeNames;
- (NSSet)activeScales;
- (NSSet)activeScenarios;
- (void)_activateFilters:(id)a3 setValueBlock:(id)a4;
- (void)_cleanUpOrphanedEmptyFiltersIfNecessary;
- (void)_deactivateFilters:(id)a3;
- (void)_writeToDisk;
- (void)activateName:(id)a3;
- (void)activateScale:(int)a3;
- (void)activateScenario:(int)a3;
- (void)deactivateName:(id)a3;
- (void)deactivateScale:(int)a3;
- (void)deactivateScenario:(int)a3;
- (void)setDelegate:(id)a3;
@end

@implementation GEOResourceFiltersManager

- (NSSet)activeScenarios
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (GEOConfigGetBOOL(GeoServicesConfig_ActivateAllResourceFilters, (uint64_t)off_1E91141F8))
  {
    v3 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED73ED70];
  }
  else
  {
    v3 = [MEMORY[0x1E4F1CA80] set];
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [(GEOActiveResourceFilters *)self->_activeFilters filters];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v10 whichFilter] == 2 && (objc_msgSend(v10, "_isFilterStaleThresholdExpired") & 1) == 0)
          {
            v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "scenario"));
            [v3 addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(p_lock);
    [v3 addObject:&unk_1ED73DAC8];
  }

  return (NSSet *)v3;
}

- (NSSet)activeScales
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (GEOConfigGetBOOL(GeoServicesConfig_ActivateAllResourceFilters, (uint64_t)off_1E91141F8))
  {
    v3 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED73ED58];
  }
  else
  {
    v3 = [MEMORY[0x1E4F1CA80] set];
    os_unfair_lock_lock_with_options();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v4 = [(GEOActiveResourceFilters *)self->_activeFilters filters];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v9 whichFilter] == 1 && (objc_msgSend(v9, "_isFilterStaleThresholdExpired") & 1) == 0)
          {
            v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "scale"));
            [v3 addObject:v10];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    os_unfair_lock_unlock(&self->_lock);
    v11 = objc_msgSend(NSNumber, "numberWithInt:", -[GEOResourceManifestConfiguration defaultScale](self->_configuration, "defaultScale"));
    [v3 addObject:v11];
  }

  return (NSSet *)v3;
}

- (void)activateScale:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v3 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = off_1E53DF2B8[(int)v3];
    }
    *(_DWORD *)buf = 138477827;
    long long v15 = v6;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Asked to activate scale '%{private}@'", buf, 0xCu);
  }
  if ([(GEOResourceManifestConfiguration *)self->_configuration defaultScale] == v3)
  {
    uint64_t v7 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Not bothering to formally activate this scale, since it is the device's main screen scale", buf, 2u);
    }
  }
  else
  {
    uint64_t v7 = [(GEOResourceFiltersManager *)self activeScales];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__GEOResourceFiltersManager_activateScale___block_invoke;
    v12[3] = &__block_descriptor_36_e33_B16__0__GEOActiveResourceFilter_8l;
    int v13 = v3;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__GEOResourceFiltersManager_activateScale___block_invoke_2;
    v10[3] = &__block_descriptor_36_e33_v16__0__GEOActiveResourceFilter_8l;
    int v11 = v3;
    [(GEOResourceFiltersManager *)self _activateFilters:v12 setValueBlock:v10];
    uint64_t v8 = [(GEOResourceFiltersManager *)self activeScales];
    if (([v8 isEqualToSet:v7] & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained filtersManagerDidChangeActiveFilters:self];
    }
  }
}

- (GEOResourceFiltersManager)init
{
  result = (GEOResourceFiltersManager *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOResourceFiltersManager)initWithConfiguration:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = (GEOResourceManifestConfiguration *)a3;
  v26.receiver = self;
  v26.super_class = (Class)GEOResourceFiltersManager;
  uint64_t v5 = [(GEOResourceFiltersManager *)&v26 init];
  if (v5)
  {
    if (!v4) {
      v4 = objc_alloc_init(GEOResourceManifestConfiguration);
    }
    objc_storeStrong((id *)&v5->_configuration, v4);
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v6 = GEOActiveResourceFiltersPath(v4);
    if ([v6 length])
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6];
      if (v7)
      {
        uint64_t v8 = [[GEOActiveResourceFilters alloc] initWithData:v7];
        activeFilters = v5->_activeFilters;
        v5->_activeFilters = v8;
      }
    }
    if (!v5->_activeFilters)
    {
      v10 = objc_alloc_init(GEOActiveResourceFilters);
      int v11 = v5->_activeFilters;
      v5->_activeFilters = v10;
    }
    v12 = _getValue(GeoServicesConfig_ExplicitResourceFilters, (uint64_t)off_1E9113A28, 1, 0, 0, 0);
    int v13 = [(GEOResourceFiltersManager *)v5 activeNames];
    if (([v12 isEqual:v13] & 1) == 0)
    {
      long long v14 = (void *)[v12 mutableCopy];
      [v14 minusSet:v13];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v23;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v23 != v18) {
              objc_enumerationMutation(v15);
            }
            -[GEOResourceFiltersManager activateName:](v5, "activateName:", *(void *)(*((void *)&v22 + 1) + 8 * v19++), (void)v22);
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v17);
      }
    }
    [(GEOResourceFiltersManager *)v5 _cleanUpOrphanedEmptyFiltersIfNecessary];
    v20 = v5;
  }
  return v5;
}

- (void)_cleanUpOrphanedEmptyFiltersIfNecessary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = [(GEOActiveResourceFilters *)self->_activeFilters filters];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![*(id *)(*((void *)&v19 + 1) + 8 * i) whichFilter])
        {

          v4 = [MEMORY[0x1E4F1CA48] array];
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          v9 = [(GEOActiveResourceFilters *)self->_activeFilters filters];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v16;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v16 != v12) {
                  objc_enumerationMutation(v9);
                }
                long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * j);
                if ([v14 whichFilter]) {
                  [v4 addObject:v14];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v11);
          }

          [(GEOActiveResourceFilters *)self->_activeFilters setFilters:v4];
          [(GEOResourceFiltersManager *)self _writeToDisk];
          goto LABEL_20;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_20:

  os_unfair_lock_unlock(p_lock);
}

- (NSSet)activeNames
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(GEOActiveResourceFilters *)self->_activeFilters filters];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 whichFilter] == 3 && (objc_msgSend(v10, "_isFilterStaleThresholdExpired") & 1) == 0)
        {
          uint64_t v11 = [v10 name];
          [v3 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v3;
}

- (void)_writeToDisk
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = GEOActiveResourceFiltersPath(self->_configuration);
  v4 = [v3 stringByDeletingLastPathComponent];
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v23 = 0;
  if ([v5 fileExistsAtPath:v4 isDirectory:&v23]) {
    BOOL v6 = v23 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v30 = *MEMORY[0x1E4F28330];
    v31[0] = &unk_1ED73DB10;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v7 error:0];
  }
  uint64_t v8 = [(GEOActiveResourceFilters *)self->_activeFilters data];
  id v22 = 0;
  int v9 = [v8 writeToFile:v3 options:268435457 error:&v22];
  id v10 = v22;

  if (v9)
  {
    id v21 = 0;
    uint64_t v11 = [v5 attributesOfItemAtPath:v3 error:&v21];
    uint64_t v12 = v21;
    if (v12)
    {
      long long v13 = v12;
    }
    else
    {
      uint64_t v14 = *MEMORY[0x1E4F28330];
      long long v15 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F28330]];
      char v16 = [v15 isEqualToNumber:&unk_1ED73DB28];

      if ((v16 & 1) == 0)
      {
        uint64_t v18 = *MEMORY[0x1E4F28378];
        v28[0] = *MEMORY[0x1E4F28370];
        v28[1] = v14;
        v29[0] = v18;
        v29[1] = &unk_1ED73DB28;
        long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

        id v20 = 0;
        [v5 setAttributes:v17 ofItemAtPath:v3 error:&v20];
        long long v13 = v20;
        if (v13)
        {
          long long v19 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138478083;
            id v25 = v3;
            __int16 v26 = 2113;
            v27 = v13;
            _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_DEBUG, "Couldn't set permissions for active resource filters %{private}@\n%{private}@", buf, 0x16u);
          }
        }
        goto LABEL_15;
      }
      long long v13 = 0;
    }
    long long v17 = v11;
LABEL_15:

    goto LABEL_16;
  }
  long long v13 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v10;
    _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Couldn't write active resource filters to disk: %{public}@", buf, 0xCu);
  }
LABEL_16:
}

- (void)_activateFilters:(id)a3 setValueBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (unsigned int (**)(id, void *))a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void))v7;
  if (v6 && v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    os_unfair_lock_lock(&self->_lock);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = [(GEOActiveResourceFilters *)self->_activeFilters filters];
    uint64_t v11 = [(GEOActiveResourceFilter *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (v6[2](v6, v15))
          {
            [v15 setLastTimestamp:Current];
            goto LABEL_13;
          }
        }
        uint64_t v12 = [(GEOActiveResourceFilter *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v10 = objc_alloc_init(GEOActiveResourceFilter);
    [(GEOActiveResourceFilter *)v10 setLastTimestamp:Current];
    ((void (**)(void, GEOActiveResourceFilter *))v8)[2](v8, v10);
    [(GEOActiveResourceFilters *)self->_activeFilters addFilter:v10];
LABEL_13:

    [(GEOResourceFiltersManager *)self _writeToDisk];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_deactivateFilters:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t (**)(id, void))a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = [(GEOActiveResourceFilters *)self->_activeFilters filters];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          if (v4[2](v4, *(void *)(*((void *)&v22 + 1) + 8 * i)))
          {

            if ([(GEOActiveResourceFilters *)self->_activeFilters filtersCount] == 1)
            {
              [(GEOActiveResourceFilters *)self->_activeFilters clearFilters];
            }
            else
            {
              id v10 = objc_alloc_init(GEOActiveResourceFilters);
              long long v18 = 0u;
              long long v19 = 0u;
              long long v20 = 0u;
              long long v21 = 0u;
              uint64_t v11 = [(GEOActiveResourceFilters *)self->_activeFilters filters];
              uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v19;
                do
                {
                  for (uint64_t j = 0; j != v13; ++j)
                  {
                    if (*(void *)v19 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * j);
                    if ((v4[2](v4, v16) & 1) == 0) {
                      [(GEOActiveResourceFilters *)v10 addFilter:v16];
                    }
                  }
                  uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
                }
                while (v13);
              }

              activeFilters = self->_activeFilters;
              self->_activeFilters = v10;
            }
            goto LABEL_23;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

LABEL_23:
    [(GEOResourceFiltersManager *)self _writeToDisk];
    os_unfair_lock_unlock(&self->_lock);
  }
}

BOOL __43__GEOResourceFiltersManager_activateScale___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 whichFilter] == 1 && objc_msgSend(v3, "scale") == *(_DWORD *)(a1 + 32);

  return v4;
}

uint64_t __43__GEOResourceFiltersManager_activateScale___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setScale:*(unsigned int *)(a1 + 32)];
}

- (void)deactivateScale:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v3 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = off_1E53DF2B8[(int)v3];
    }
    *(_DWORD *)buf = 138477827;
    uint64_t v13 = v6;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Asked to deactivate scale '%{private}@'", buf, 0xCu);
  }
  uint64_t v7 = [(GEOResourceFiltersManager *)self activeScales];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__GEOResourceFiltersManager_deactivateScale___block_invoke;
  v10[3] = &__block_descriptor_36_e33_B16__0__GEOActiveResourceFilter_8l;
  int v11 = v3;
  [(GEOResourceFiltersManager *)self _deactivateFilters:v10];
  uint64_t v8 = [(GEOResourceFiltersManager *)self activeScales];
  if (([v8 isEqualToSet:v7] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained filtersManagerDidChangeActiveFilters:self];
  }
}

BOOL __45__GEOResourceFiltersManager_deactivateScale___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 whichFilter] == 1 && objc_msgSend(v3, "scale") == *(_DWORD *)(a1 + 32);

  return v4;
}

- (void)activateScenario:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v3 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = off_1E53DF2D8[(int)v3];
    }
    *(_DWORD *)buf = 138477827;
    long long v15 = v6;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Asked to activate scenario '%{private}@'", buf, 0xCu);
  }
  uint64_t v7 = [(GEOResourceFiltersManager *)self activeScenarios];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__GEOResourceFiltersManager_activateScenario___block_invoke;
  v12[3] = &__block_descriptor_36_e33_B16__0__GEOActiveResourceFilter_8l;
  int v13 = v3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__GEOResourceFiltersManager_activateScenario___block_invoke_2;
  v10[3] = &__block_descriptor_36_e33_v16__0__GEOActiveResourceFilter_8l;
  int v11 = v3;
  [(GEOResourceFiltersManager *)self _activateFilters:v12 setValueBlock:v10];
  uint64_t v8 = [(GEOResourceFiltersManager *)self activeScenarios];
  if (([v8 isEqualToSet:v7] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained filtersManagerDidChangeActiveFilters:self];
  }
}

BOOL __46__GEOResourceFiltersManager_activateScenario___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 whichFilter] == 2 && objc_msgSend(v3, "scenario") == *(_DWORD *)(a1 + 32);

  return v4;
}

uint64_t __46__GEOResourceFiltersManager_activateScenario___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setScenario:*(unsigned int *)(a1 + 32)];
}

- (void)deactivateScenario:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v3 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = off_1E53DF2D8[(int)v3];
    }
    *(_DWORD *)buf = 138477827;
    int v13 = v6;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Asked to deactivate scenario '%{private}@'", buf, 0xCu);
  }
  uint64_t v7 = [(GEOResourceFiltersManager *)self activeScenarios];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__GEOResourceFiltersManager_deactivateScenario___block_invoke;
  v10[3] = &__block_descriptor_36_e33_B16__0__GEOActiveResourceFilter_8l;
  int v11 = v3;
  [(GEOResourceFiltersManager *)self _deactivateFilters:v10];
  uint64_t v8 = [(GEOResourceFiltersManager *)self activeScenarios];
  if (([v8 isEqualToSet:v7] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained filtersManagerDidChangeActiveFilters:self];
  }
}

BOOL __48__GEOResourceFiltersManager_deactivateScenario___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 whichFilter] == 2 && objc_msgSend(v3, "scenario") == *(_DWORD *)(a1 + 32);

  return v4;
}

- (void)activateName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      id v17 = v4;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Asked to activate name '%{private}@'", buf, 0xCu);
    }

    uint64_t v6 = [(GEOResourceFiltersManager *)self activeNames];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__GEOResourceFiltersManager_activateName___block_invoke;
    v14[3] = &unk_1E53DF270;
    id v15 = v4;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    int v11 = __42__GEOResourceFiltersManager_activateName___block_invoke_2;
    uint64_t v12 = &unk_1E53DF298;
    id v13 = v15;
    [(GEOResourceFiltersManager *)self _activateFilters:v14 setValueBlock:&v9];
    uint64_t v7 = [(GEOResourceFiltersManager *)self activeNames];
    if (([v7 isEqualToSet:v6] & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained filtersManagerDidChangeActiveFilters:self];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: name != ((void *)0)", buf, 2u);
  }
}

uint64_t __42__GEOResourceFiltersManager_activateName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 whichFilter] == 3)
  {
    id v4 = [v3 name];
    uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __42__GEOResourceFiltersManager_activateName___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setName:v2];
  [v3 setHasLastTimestamp:0];
}

- (void)deactivateName:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v13 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Asked to deactivate name '%{private}@'", buf, 0xCu);
  }

  uint64_t v6 = [(GEOResourceFiltersManager *)self activeNames];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__GEOResourceFiltersManager_deactivateName___block_invoke;
  v10[3] = &unk_1E53DF270;
  id v11 = v4;
  id v7 = v4;
  [(GEOResourceFiltersManager *)self _deactivateFilters:v10];
  uint64_t v8 = [(GEOResourceFiltersManager *)self activeNames];
  if (([v8 isEqualToSet:v6] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained filtersManagerDidChangeActiveFilters:self];
  }
}

uint64_t __44__GEOResourceFiltersManager_deactivateName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 whichFilter] == 3)
  {
    id v4 = [v3 name];
    uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (GEOResourceFiltersManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOResourceFiltersManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeFilters, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end