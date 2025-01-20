@interface BBSectionInfoStore
- (BBSectionInfoStore)initWithEffectiveSettingsProvider:(id)a3 persistence:(id)a4;
- (id)activeSectionIDs;
- (id)allSortedActiveSections:(BOOL)a3;
- (id)allSortedSectionInfo:(BOOL)a3;
- (id)allUnsortedSectionInfoIDs;
- (id)clearedInfoForSectionID:(id)a3;
- (id)clearedSectionsByID;
- (id)effectiveSectionInfoForSectionInfo:(id)a3;
- (id)sectionInfoByID;
- (id)sectionInfoForSectionID:(id)a3 effective:(BOOL)a4;
- (id)sectionInfosByIDForSectionIDs:(id)a3 effective:(BOOL)a4;
- (id)sortedSectionIDs;
- (id)sortedSectionInfoForSectionIDs:(id)a3 effective:(BOOL)a4;
- (void)_sortSectionIDs:(id)a3 usingGuideArray:(id)a4;
- (void)addActiveSectionID:(id)a3;
- (void)removeSectionWithID:(id)a3;
- (void)setClearedInfo:(id)a3 forSectionID:(id)a4;
- (void)setClearedSectionsByID:(id)a3;
- (void)setSectionInfo:(id)a3 forSectionID:(id)a4;
- (void)setSectionInfoByID:(id)a3;
@end

@implementation BBSectionInfoStore

- (id)sectionInfoForSectionID:(id)a3 effective:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(NSMutableDictionary *)self->_sectionInfoByID objectForKey:a3];
  if (v4)
  {
    uint64_t v7 = [(BBSectionInfoStore *)self effectiveSectionInfoForSectionInfo:v6];

    v6 = (void *)v7;
  }
  return v6;
}

- (id)effectiveSectionInfoForSectionInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 factorySectionID];

    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v7 = [v5 factorySectionID];
    v8 = [(BBSectionInfoStore *)self sectionInfoForSectionID:v7 effective:0];

    if (!v8) {
      goto LABEL_5;
    }
    uint64_t v9 = [(BBEffectiveSettingsProvider *)self->_effectiveSettings effectiveGlobalContentPreviewSetting];
    uint64_t v10 = [(BBEffectiveSettingsProvider *)self->_effectiveSettings effectiveGlobalAnnounceSetting];
    uint64_t v11 = [(BBEffectiveSettingsProvider *)self->_effectiveSettings effectiveGlobalScheduledDeliverySetting];
    uint64_t v12 = [(BBEffectiveSettingsProvider *)self->_effectiveSettings effectiveGlobalSummarizationSetting];
    uint64_t v13 = [(BBEffectiveSettingsProvider *)self->_effectiveSettings hasPairedVehiclesForCarPlay];
    LOBYTE(v16) = [(BBEffectiveSettingsProvider *)self->_effectiveSettings hasDestinationForRemoteNotifications];
    v14 = [v5 effectiveSectionInfoWithFactoryInfo:v8 defaultContentPreviewSetting:v9 globalAnnounceSetting:v10 globalScheduledDeliverySetting:v11 globalSummarizationSetting:v12 hasPairedVehiclesForCarPlay:v13 hasDestinationForRemoteNotifications:v16];

    if (!v14)
    {
LABEL_5:
      objc_msgSend(v5, "effectiveSectionInfoWithDefaultContentPreviewSetting:globalAnnounceSetting:globalScheduledDeliverySetting:globalSummarizationSetting:hasPairedVehiclesForCarPlay:hasDestinationForRemoteNotifications:", -[BBEffectiveSettingsProvider effectiveGlobalContentPreviewSetting](self->_effectiveSettings, "effectiveGlobalContentPreviewSetting"), -[BBEffectiveSettingsProvider effectiveGlobalAnnounceSetting](self->_effectiveSettings, "effectiveGlobalAnnounceSetting"), -[BBEffectiveSettingsProvider effectiveGlobalScheduledDeliverySetting](self->_effectiveSettings, "effectiveGlobalScheduledDeliverySetting"), -[BBEffectiveSettingsProvider effectiveGlobalSummarizationSetting](self->_effectiveSettings, "effectiveGlobalSummarizationSetting"), -[BBEffectiveSettingsProvider hasPairedVehiclesForCarPlay](self->_effectiveSettings, "hasPairedVehiclesForCarPlay"), -[BBEffectiveSettingsProvider hasDestinationForRemoteNotifications](
          self->_effectiveSettings,
      v14 = "hasDestinationForRemoteNotifications"));
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BBSectionInfoStore)initWithEffectiveSettingsProvider:(id)a3 persistence:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)BBSectionInfoStore;
  uint64_t v9 = [(BBSectionInfoStore *)&v19 init];
  if (v9)
  {
    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sectionInfoByID = v9->_sectionInfoByID;
    v9->_sectionInfoByID = v10;

    uint64_t v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    activeSectionIDs = v9->_activeSectionIDs;
    v9->_activeSectionIDs = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sortedSectionIDs = v9->_sortedSectionIDs;
    v9->_sortedSectionIDs = v14;

    uint64_t v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clearedSectionsByID = v9->_clearedSectionsByID;
    v9->_clearedSectionsByID = v16;

    objc_storeStrong((id *)&v9->_effectiveSettings, a3);
    objc_storeStrong((id *)&v9->_persistence, a4);
  }

  return v9;
}

- (id)sectionInfoByID
{
  return self->_sectionInfoByID;
}

- (void)removeSectionWithID:(id)a3
{
  sectionInfoByID = self->_sectionInfoByID;
  id v5 = a3;
  [(NSMutableDictionary *)sectionInfoByID removeObjectForKey:v5];
  [(NSMutableSet *)self->_activeSectionIDs removeObject:v5];
  [(NSMutableArray *)self->_sortedSectionIDs removeObject:v5];
  [(NSMutableDictionary *)self->_clearedSectionsByID removeObjectForKey:v5];

  [(BBPersistentStoreInterface *)self->_persistence writeSectionInfo:self->_sectionInfoByID];
  persistence = self->_persistence;
  clearedSectionsByID = self->_clearedSectionsByID;
  [(BBPersistentStoreInterface *)persistence writeClearedSections:clearedSectionsByID];
}

- (id)sortedSectionInfoForSectionIDs:(id)a3 effective:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF980] array];
  id v8 = (void *)MEMORY[0x263EFF980];
  uint64_t v9 = [v6 allObjects];
  uint64_t v10 = [v8 arrayWithArray:v9];

  [(BBSectionInfoStore *)self _sortSectionIDs:v10 usingGuideArray:self->_sortedSectionIDs];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = -[BBSectionInfoStore sectionInfoForSectionID:effective:](self, "sectionInfoForSectionID:effective:", *(void *)(*((void *)&v18 + 1) + 8 * i), v4, (void)v18);
        if (v16) {
          [v7 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v7;
}

- (id)allUnsortedSectionInfoIDs
{
  return (id)[(NSMutableDictionary *)self->_sectionInfoByID allKeys];
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4
{
}

- (void)setSectionInfoByID:(id)a3
{
  self->_sectionInfoByID = (NSMutableDictionary *)[a3 mutableCopy];
  MEMORY[0x270F9A758]();
}

- (void)addActiveSectionID:(id)a3
{
  id v4 = a3;
  [(NSMutableSet *)self->_activeSectionIDs addObject:v4];
  if (([(NSMutableArray *)self->_sortedSectionIDs containsObject:v4] & 1) == 0) {
    [(NSMutableArray *)self->_sortedSectionIDs addObject:v4];
  }
}

- (id)activeSectionIDs
{
  return self->_activeSectionIDs;
}

- (id)sortedSectionIDs
{
  return self->_sortedSectionIDs;
}

- (id)allSortedSectionInfo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = [(BBSectionInfoStore *)self allUnsortedSectionInfoIDs];
  id v7 = [v5 setWithArray:v6];

  id v8 = [(BBSectionInfoStore *)self sortedSectionInfoForSectionIDs:v7 effective:v3];

  return v8;
}

- (void)_sortSectionIDs:(id)a3 usingGuideArray:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    uint64_t v7 = [v6 count];
    if (v5 != v6)
    {
      if (v7)
      {
        v32 = v6;
        id v8 = [MEMORY[0x263EFFA08] setWithArray:v6];
        uint64_t v9 = [MEMORY[0x263EFFA08] setWithArray:v5];
        v36 = [MEMORY[0x263EFF9A0] dictionary];
        v41 = (void *)[v5 mutableCopy];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v31 = v5;
        obuint64_t j = v5;
        uint64_t v37 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
        if (v37)
        {
          uint64_t v34 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v54 != v34) {
                objc_enumerationMutation(obj);
              }
              uint64_t v42 = *(void *)(*((void *)&v53 + 1) + 8 * i);
              id v11 = -[BBSectionInfoStore sectionInfoForSectionID:effective:](self, "sectionInfoForSectionID:effective:");
              uint64_t v12 = [v11 dataProviderIDs];
              if ([v12 count])
              {
                v39 = v11;
                uint64_t v40 = i;
                uint64_t v13 = [MEMORY[0x263EFF980] array];
                long long v49 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                v38 = v12;
                id v14 = v12;
                uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v62 count:16];
                if (v15)
                {
                  uint64_t v16 = v15;
                  uint64_t v17 = *(void *)v50;
                  do
                  {
                    for (uint64_t j = 0; j != v16; ++j)
                    {
                      if (*(void *)v50 != v17) {
                        objc_enumerationMutation(v14);
                      }
                      uint64_t v19 = *(void *)(*((void *)&v49 + 1) + 8 * j);
                      if ([v9 containsObject:v19])
                      {
                        if (([v8 containsObject:v19] & 1) == 0) {
                          [v13 addObject:v19];
                        }
                      }
                      else
                      {
                        long long v20 = BBLogGeneral;
                        if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          uint64_t v59 = v19;
                          __int16 v60 = 2112;
                          uint64_t v61 = v42;
                          _os_log_error_impl(&dword_217675000, v20, OS_LOG_TYPE_ERROR, "BBServer: unknown subsection \"%@\" (of \"%@\") cannot be sorted.", buf, 0x16u);
                        }
                      }
                    }
                    uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v62 count:16];
                  }
                  while (v16);
                }

                if ([v13 count])
                {
                  [v36 setObject:v13 forKey:v42];
                  [v41 removeObjectsInArray:v13];
                }

                id v11 = v39;
                uint64_t i = v40;
                uint64_t v12 = v38;
              }
            }
            uint64_t v37 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
          }
          while (v37);
        }

        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __54__BBSectionInfoStore__sortSectionIDs_usingGuideArray___block_invoke;
        v47[3] = &unk_264295CB0;
        id v48 = v32;
        [v41 sortUsingComparator:v47];
        long long v21 = v36;
        if ([v36 count])
        {
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v22 = [v36 allKeys];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v57 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v44;
            do
            {
              for (uint64_t k = 0; k != v24; ++k)
              {
                if (*(void *)v44 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void *)(*((void *)&v43 + 1) + 8 * k);
                v28 = [v36 objectForKey:v27];
                uint64_t v29 = [v41 indexOfObject:v27];
                if (v29 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v30 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v29 + 1, objc_msgSend(v28, "count"));
                  [v41 insertObjects:v28 atIndexes:v30];
                }
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v43 objects:v57 count:16];
            }
            while (v24);
          }

          long long v21 = v36;
        }
        [obj removeAllObjects];
        [obj addObjectsFromArray:v41];

        id v5 = v31;
        id v6 = v32;
      }
    }
  }
}

uint64_t __54__BBSectionInfoStore__sortSectionIDs_usingGuideArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqual:v6])
  {
    uint64_t v7 = 0;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "isEqual:", v5, (void)v15))
          {
            uint64_t v7 = -1;
            goto LABEL_16;
          }
          if ([v13 isEqual:v6])
          {
            uint64_t v7 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v7 = 0;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
LABEL_16:
  }
  return v7;
}

- (id)allSortedActiveSections:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BBSectionInfoStore *)self activeSectionIDs];
  id v6 = [(BBSectionInfoStore *)self sortedSectionInfoForSectionIDs:v5 effective:v3];

  return v6;
}

- (id)sectionInfosByIDForSectionIDs:(id)a3 effective:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = [(BBSectionInfoStore *)self sortedSectionInfoForSectionIDs:a3 effective:a4];
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
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
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "sectionID", (void)v14);
        [v5 setObject:v11 forKey:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)clearedInfoForSectionID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_clearedSectionsByID objectForKey:a3];
}

- (void)setClearedInfo:(id)a3 forSectionID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9
    && ([MEMORY[0x263EFF9D0] null],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqual:v9],
        v7,
        (v8 & 1) == 0))
  {
    [(NSMutableDictionary *)self->_clearedSectionsByID setObject:v9 forKey:v6];
  }
  else
  {
    [(NSMutableDictionary *)self->_clearedSectionsByID removeObjectForKey:v6];
  }
}

- (id)clearedSectionsByID
{
  return self->_clearedSectionsByID;
}

- (void)setClearedSectionsByID:(id)a3
{
  self->_clearedSectionsByID = (NSMutableDictionary *)[a3 mutableCopy];
  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_effectiveSettings, 0);
  objc_storeStrong((id *)&self->_clearedSectionsByID, 0);
  objc_storeStrong((id *)&self->_sortedSectionIDs, 0);
  objc_storeStrong((id *)&self->_activeSectionIDs, 0);
  objc_storeStrong((id *)&self->_sectionInfoByID, 0);
}

@end