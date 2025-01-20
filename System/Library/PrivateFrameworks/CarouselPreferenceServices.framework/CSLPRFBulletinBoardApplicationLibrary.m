@interface CSLPRFBulletinBoardApplicationLibrary
- (CSLPRFBulletinBoardApplicationLibrary)init;
- (NSArray)allApplications;
- (NSDictionary)allApplicationsDictionary;
- (id)_loadApplications;
- (id)applicationWithBundleIdentifier:(id)a3;
- (void)addObserver:(id)a3;
- (void)allApplicationsWithCompletion:(id)a3;
- (void)applicationWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation CSLPRFBulletinBoardApplicationLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_cachedApplications, 0);
  objc_storeStrong((id *)&self->_observationHelper, 0);
}

- (void)removeObserver:(id)a3
{
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CSLPRFBulletinBoardApplicationLibrary *)self allApplications];
  [(CSLPRFObservationHelper *)self->_observationHelper addObserver:v4];
  [v4 applicationLibrary:self didAddApplications:v5];
}

- (void)allApplicationsWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = [(CSLPRFBulletinBoardApplicationLibrary *)self allApplications];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (NSDictionary)allApplicationsDictionary
{
  v2 = -[CSLPRFBulletinBoardApplicationLibrary _loadApplications]((uint64_t)self);
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (id)_loadApplications
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v1 = [MEMORY[0x263EFF9A0] dictionary];
    v2 = [MEMORY[0x263F5B958] sharedManager];
    [v2 loadBBSections];

    v3 = [MEMORY[0x263F5B958] sharedManager];
    id v4 = [v3 bbSections];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v27;
      *(void *)&long long v7 = 138412546;
      long long v21 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v11, "allowsNotifications", v21)
            && ([v11 alertType] || objc_msgSend(v11, "lockScreenSetting") == 2)
            && ([v11 suppressFromSettings] & 1) == 0
            && [v11 sectionType] != 1)
          {
            v12 = +[CSLPRFApp appWithBBSectionInfo:v11];
            id v13 = [v12 bundleIdentifier];
            if ([v13 isEqualToString:@"com.apple.news"]
              && (BPSIsNewsAllowed() & 1) == 0)
            {
              v14 = cslprf_app_library_log();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v21;
                uint64_t v32 = a1;
                __int16 v33 = 2112;
                id v34 = v13;
                _os_log_debug_impl(&dword_22F4EA000, v14, OS_LOG_TYPE_DEBUG, "%@ app %@ hidden by policy", buf, 0x16u);
              }
            }
            else
            {

              [v1 setObject:v12 forKey:v13];
            }
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    id v15 = *(id *)(a1 + 16);
    objc_storeStrong((id *)(a1 + 16), v1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__CSLPRFBulletinBoardApplicationLibrary__loadApplications__block_invoke;
    block[3] = &unk_264A0BAB0;
    block[4] = a1;
    id v16 = v1;
    id v24 = v16;
    id v25 = v15;
    id v17 = v15;
    dispatch_async(MEMORY[0x263EF83A0], block);
    v18 = v25;
    id v19 = v16;
  }
  else
  {
    id v19 = 0;
  }
  return v19;
}

void __58__CSLPRFBulletinBoardApplicationLibrary__loadApplications__block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    long long v7 = [MEMORY[0x263EFF980] array];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __99__CSLPRFBulletinBoardApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke;
    v33[3] = &unk_264A0B4A0;
    id v22 = v4;
    id v8 = v4;
    id v34 = v8;
    id v21 = v6;
    id v35 = v21;
    id v9 = v5;
    id v36 = v9;
    [v3 enumerateKeysAndObjectsUsingBlock:v33];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v16 = objc_msgSend(v3, "objectForKey:", v15, v21);

          if (!v16) {
            [v7 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v12);
    }

    if ([v9 count])
    {
      id v17 = *(void **)(v1 + 8);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __99__CSLPRFBulletinBoardApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke_2;
      v27[3] = &unk_264A0B4C8;
      v27[4] = v1;
      id v28 = v9;
      [v17 notifyObserversWithBlock:v27];
    }
    v18 = v21;
    if (objc_msgSend(v21, "count", v21))
    {
      id v19 = *(void **)(v1 + 8);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __99__CSLPRFBulletinBoardApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke_3;
      v25[3] = &unk_264A0B4C8;
      v25[4] = v1;
      id v26 = v18;
      [v19 notifyObserversWithBlock:v25];
    }
    if ([v7 count])
    {
      v20 = *(void **)(v1 + 8);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __99__CSLPRFBulletinBoardApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke_4;
      v23[3] = &unk_264A0B4C8;
      v23[4] = v1;
      id v24 = v7;
      [v20 notifyObserversWithBlock:v23];
    }
    id v4 = v22;
  }
}

void __99__CSLPRFBulletinBoardApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = [a1[4] objectForKey:a2];
  if (v5)
  {
    if ([v8 isEqual:v5]) {
      goto LABEL_6;
    }
    id v6 = v8;
    long long v7 = a1 + 5;
  }
  else
  {
    id v6 = v8;
    long long v7 = a1 + 6;
  }
  [*v7 addObject:v6];
LABEL_6:
}

uint64_t __99__CSLPRFBulletinBoardApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didAddApplications:*(void *)(a1 + 40)];
}

uint64_t __99__CSLPRFBulletinBoardApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didUpdateApplications:*(void *)(a1 + 40)];
}

uint64_t __99__CSLPRFBulletinBoardApplicationLibrary__notifyObserversOfChangesWithApplications_oldApplications___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 applicationLibrary:*(void *)(a1 + 32) didRemoveApplications:*(void *)(a1 + 40)];
}

- (NSArray)allApplications
{
  v2 = -[CSLPRFBulletinBoardApplicationLibrary _loadApplications]((uint64_t)self);
  id v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (void)applicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = [(CSLPRFBulletinBoardApplicationLibrary *)self applicationWithBundleIdentifier:a3];
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    id v5 = self->_lock_cachedApplications;
    os_unfair_lock_unlock(&self->_lock);
    if (!v5)
    {
      -[CSLPRFBulletinBoardApplicationLibrary _loadApplications]((uint64_t)self);
      id v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [(NSMutableDictionary *)v5 objectForKey:v4];

  return v6;
}

- (CSLPRFBulletinBoardApplicationLibrary)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSLPRFBulletinBoardApplicationLibrary;
  v2 = [(CSLPRFBulletinBoardApplicationLibrary *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = objc_alloc_init(CSLPRFObservationHelper);
    observationHelper = v3->_observationHelper;
    v3->_observationHelper = v4;
  }
  return v3;
}

@end