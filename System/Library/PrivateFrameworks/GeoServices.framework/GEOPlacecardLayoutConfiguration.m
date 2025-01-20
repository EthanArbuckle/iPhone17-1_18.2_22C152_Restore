@interface GEOPlacecardLayoutConfiguration
- (GEOModuleLayoutEntry)currentModuleLayoutEntry;
- (GEOPlacecardLayoutConfiguration)initWithPlacecardLayoutConfiguration:(id)a3 moduleConfigurationProvider:(id)a4;
@end

@implementation GEOPlacecardLayoutConfiguration

- (GEOPlacecardLayoutConfiguration)initWithPlacecardLayoutConfiguration:(id)a3 moduleConfigurationProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOPlacecardLayoutConfiguration;
  v9 = [(GEOPlacecardLayoutConfiguration *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placecardLayoutConfiguration, a3);
    objc_storeWeak((id *)&v10->_moduleConfigProvider, v8);
    v11 = v10;
  }

  return v10;
}

- (GEOModuleLayoutEntry)currentModuleLayoutEntry
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v4 = [v3 bundleIdentifier];

  v5 = GEOGetPlaceCardLayoutLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v49 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Current bundle identifier is %@", buf, 0xCu);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v38 = self;
  id obj = [(GEOPDPlacecardLayoutConfiguration *)self->_placecardLayoutConfiguration entries];
  v39 = (void *)v4;
  uint64_t v42 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  id v6 = 0;
  id v7 = 0;
  id v8 = 0;
  id v9 = 0;
  if (v42)
  {
    uint64_t v41 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v44 != v41) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v12 = [v11 applicationIds];
        int v13 = [v12 containsObject:v4];

        int v14 = [v11 platformType];
        int v15 = v14;
        if (v7) {
          int v16 = 1;
        }
        else {
          int v16 = v13 ^ 1;
        }
        if (!v16) {
          id v7 = 0;
        }
        if ((v16 & 1) == 0 && v14 == 1) {
          id v7 = v11;
        }
        if (v9) {
          goto LABEL_21;
        }
        v17 = [v11 applicationIds];
        uint64_t v18 = [v17 count];

        uint64_t v4 = (uint64_t)v39;
        BOOL v19 = v18 == 0;
        id v9 = 0;
        BOOL v19 = v19 && v15 == 1;
        if (v19)
        {
          id v9 = v11;
          if (((v8 == 0) & v13) != 0) {
            id v8 = 0;
          }
          if (!v6)
          {
LABEL_30:
            v21 = [v11 applicationIds];
            if ([v21 count])
            {

              id v6 = 0;
            }
            else
            {
              id v22 = v9;
              char v23 = [v11 hasPlatformType];

              if (v23) {
                id v6 = 0;
              }
              else {
                id v6 = v11;
              }
              id v9 = v22;
            }
            continue;
          }
        }
        else
        {
LABEL_21:
          if (v8) {
            int v20 = 1;
          }
          else {
            int v20 = v13 ^ 1;
          }
          if (!v20) {
            id v8 = 0;
          }
          if ((v20 & 1) == 0 && v15 != 1) {
            id v8 = v11;
          }
          if (!v6) {
            goto LABEL_30;
          }
        }
      }
      uint64_t v42 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v42);
  }

  if (v7) {
    v24 = v7;
  }
  else {
    v24 = v8;
  }
  id v25 = v24;
  v26 = v9;
  v27 = v25;
  v28 = v26;
  if (v25) {
    v26 = v25;
  }
  id v29 = v26;

  if (v29) {
    v30 = v29;
  }
  else {
    v30 = v6;
  }
  id v31 = v30;

  if (v31)
  {
    id v32 = v6;
    v33 = GEOGetPlaceCardLayoutLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v49 = (uint64_t)v31;
      _os_log_impl(&dword_188D96000, v33, OS_LOG_TYPE_DEBUG, "Using layout %@", buf, 0xCu);
    }

    v34 = [GEOModuleLayoutEntry alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v38->_moduleConfigProvider);
    v36 = [(GEOModuleLayoutEntry *)v34 initWithModuleLayoutEntry:v31 moduleConfigProvider:WeakRetained];

    id v6 = v32;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_moduleConfigProvider);

  objc_storeStrong((id *)&self->_placecardLayoutConfiguration, 0);
}

@end