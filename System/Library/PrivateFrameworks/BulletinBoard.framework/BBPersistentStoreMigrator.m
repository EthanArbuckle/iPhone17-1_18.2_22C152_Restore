@interface BBPersistentStoreMigrator
+ (BOOL)removeSavedChronologicalSectionInfos:(id)a3;
+ (id)_sectionIDsToMigrate;
+ (id)_sectionIdentifiersForNonDefaultSectionCategoriesFromSectionInfos:(id)a3;
+ (id)_sectionIdentifiersForWeeAppsFromSectionInfos:(id)a3;
+ (void)_migrateContentPreviewSettings:(id)a3;
+ (void)_migrateSectionIDs:(id)a3;
+ (void)migrateSectionInfoForStore:(id)a3;
@end

@implementation BBPersistentStoreMigrator

+ (void)migrateSectionInfoForStore:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v51 = [MEMORY[0x263EFF9A0] dictionary];
  int v5 = [v4 hasSectionInfoLegacyFile];
  if (v5)
  {
    v6 = BBLogMigration;
    if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "Migrating from old sectionInfo file to new versionedSectionInfo file.", buf, 2u);
    }
    v7 = [v4 readSectionInfoLegacy];
    unint64_t v8 = 0;
  }
  else
  {
    v9 = [v4 readSectionInfoWithVersionNumberForMigration];
    v7 = [v9 objectForKey:@"sectionInfo"];
    v10 = [v9 objectForKey:@"sectionInfoVersionNumber"];
    unint64_t v8 = [v10 unsignedIntegerValue];
  }
  v11 = [a1 _sectionIDsToMigrate];
  v12 = [v7 allKeys];
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __56__BBPersistentStoreMigrator_migrateSectionInfoForStore___block_invoke;
  v60[3] = &unk_264296FE8;
  id v13 = v11;
  id v61 = v13;
  int v14 = objc_msgSend(v12, "bs_containsObjectPassingTest:", v60);

  if (v8 > 2)
  {
    v15 = BBLogMigration;
    if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217675000, v15, OS_LOG_TYPE_DEFAULT, "Due to a downgrade we are deleting the versioned section info file. Notification Settings will be corrupt.", buf, 2u);
    }
    [v4 deleteSectionInfoFile];
    BBIsInternalDevice();
  }
  if (v8 < 2) {
    int v16 = 1;
  }
  else {
    int v16 = v14;
  }
  if (v16 == 1)
  {
    int v43 = v14;
    unint64_t v44 = v8;
    int v45 = v5;
    id v47 = v13;
    v48 = v4;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = [v7 allKeys];
    uint64_t v17 = [obj countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v57;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v56 + 1) + 8 * v20);
          v22 = (void *)MEMORY[0x21D44A020]();
          v23 = v7;
          v24 = [v7 objectForKey:v21];
          v25 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v24 error:0];
          if (v25)
          {
            [v51 setObject:v25 forKey:v21];
          }
          else
          {
            v26 = BBLogMigration;
            if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v63 = v21;
              _os_log_error_impl(&dword_217675000, v26, OS_LOG_TYPE_ERROR, "Decoding BBSectionInfo for sectionID %{public}@ failed", buf, 0xCu);
            }
          }

          ++v20;
          v7 = v23;
        }
        while (v18 != v20);
        uint64_t v18 = [obj countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v18);
    }

    if (v43) {
      [a1 _migrateSectionIDs:v51];
    }
    id v13 = v47;
    id v4 = v48;
    if (v44 != 1)
    {
      if (v44)
      {
LABEL_46:
        [v4 writeSectionInfo:v51];
        goto LABEL_47;
      }
      [a1 _removeVestigialSections:v51];
      [a1 _migrateContentPreviewSettings:v51];
      if (v45) {
        [v48 deleteSectionInfoLegacyFile];
      }
    }
    v46 = v7;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v27 = [v51 allKeys];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v52 objects:v68 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v53;
      do
      {
        uint64_t v31 = 0;
        id obja = (id)v29;
        do
        {
          if (*(void *)v53 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v52 + 1) + 8 * v31);
          v33 = (void *)MEMORY[0x21D44A020]();
          v34 = [v51 objectForKey:v32];
          uint64_t v35 = [v34 pushSettings];
          if ([v34 alertType]) {
            unint64_t v36 = (8 * (int)v35) & 0x20 | v35;
          }
          else {
            unint64_t v36 = v35 & 0xFFFFFFFFFFFFFFDFLL;
          }
          if (v36 != [v34 pushSettings])
          {
            v37 = (void *)BBLogMigration;
            if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
            {
              v38 = v37;
              v39 = BBPushSettingsDescription([v34 pushSettings]);
              BBPushSettingsDescription(v36);
              uint64_t v40 = v30;
              v42 = v41 = v27;
              *(_DWORD *)buf = 138543874;
              uint64_t v63 = v32;
              __int16 v64 = 2114;
              v65 = v39;
              __int16 v66 = 2114;
              v67 = v42;
              _os_log_impl(&dword_217675000, v38, OS_LOG_TYPE_DEFAULT, "Migrating pushSettings of BBSectionInfo for sectionID: %{public}@ from %{public}@ to %{public}@", buf, 0x20u);

              v27 = v41;
              uint64_t v30 = v40;
              uint64_t v29 = (uint64_t)obja;
            }
            [v34 setPushSettings:v36];
          }

          ++v31;
        }
        while (v29 != v31);
        uint64_t v29 = [v27 countByEnumeratingWithState:&v52 objects:v68 count:16];
      }
      while (v29);
    }

    id v13 = v47;
    id v4 = v48;
    v7 = v46;
    goto LABEL_46;
  }
LABEL_47:
}

BOOL __56__BBPersistentStoreMigrator_migrateSectionInfoForStore___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKey:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

void __56__BBPersistentStoreMigrator_migrateSectionInfoForStore___block_invoke_23(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    [NSURL URLWithString:@"tap-to-radar://new?ComponentID=500088&ComponentName=PEP%20BulletinBoard&ComponentVersion=1.0"];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v3 = [MEMORY[0x263F01880] defaultWorkspace];
    [v3 openURL:v4 configuration:0 completionHandler:0];
  }
}

+ (void)_migrateSectionIDs:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [a1 _sectionIDsToMigrate];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v6 = [v5 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    v26 = v6;
    v27 = v5;
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v10 = 0;
      uint64_t v28 = v8;
      do
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        v12 = objc_msgSend(v5, "objectForKey:", v11, v25, v26, v27);
        id v13 = [v4 objectForKey:v11];
        if (v13)
        {
          uint64_t v30 = v11;
          id v31 = v13;
          int v14 = BBLogMigration;
          if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v42 = v30;
            __int16 v43 = 2114;
            unint64_t v44 = v12;
            _os_log_impl(&dword_217675000, v14, OS_LOG_TYPE_DEFAULT, "Migrating saved section info for \"%{public}@\" to \"%{public}@\"", buf, 0x16u);
          }
          v15 = [v4 objectForKey:v12];

          if (v15)
          {
            int v16 = BBLogMigration;
            if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v42 = v12;
              _os_log_impl(&dword_217675000, v16, OS_LOG_TYPE_DEFAULT, "\t*** Not migrating because section info for \"%{public}@\" already exists!", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v29 = v10;
            [v31 setSectionID:v12];
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            uint64_t v17 = [v31 dataProviderIDs];
            uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v33;
              do
              {
                for (uint64_t i = 0; i != v19; ++i)
                {
                  if (*(void *)v33 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                  v23 = [v4 objectForKey:v22];
                  if (v23)
                  {
                    v24 = BBLogMigration;
                    if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      v42 = v22;
                      _os_log_impl(&dword_217675000, v24, OS_LOG_TYPE_DEFAULT, "\tUpdated data provider \"%{public}@\"", buf, 0xCu);
                    }
                    [v23 setFactorySectionID:v12];
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
              }
              while (v19);
            }

            [v4 setObject:v31 forKey:v12];
            v6 = v26;
            int v5 = v27;
            uint64_t v9 = v25;
            uint64_t v8 = v28;
            uint64_t v10 = v29;
          }
          [v4 removeObjectForKey:v30];
          id v13 = v31;
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v8);
  }
}

+ (id)_sectionIDsToMigrate
{
  return &unk_26C7ABB88;
}

+ (BOOL)removeSavedChronologicalSectionInfos:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  v6 = [a1 _sectionIdentifiersForNonDefaultSectionCategoriesFromSectionInfos:v4];
  [v4 removeObjectsForKeys:v6];

  uint64_t v7 = [a1 _sectionIdentifiersForWeeAppsFromSectionInfos:v4];
  [v4 removeObjectsForKeys:v7];

  uint64_t v8 = [v4 count];
  return v8 != v5;
}

+ (id)_sectionIdentifiersForNonDefaultSectionCategoriesFromSectionInfos:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [v3 allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
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
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = [v3 objectForKey:v10];
        if ([v11 sectionCategory]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)_sectionIdentifiersForWeeAppsFromSectionInfos:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [v3 allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
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
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = [v3 objectForKey:v10];
        if ([v11 sectionType] == 1) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)_migrateContentPreviewSettings:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v3 allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v22;
    *(void *)&long long v5 = 138543874;
    long long v19 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v3, "objectForKey:", v9, v19);
        v11 = [v10 sectionInfoSettings];
        unint64_t v12 = [v11 contentPreviewSetting];

        if (v12 == 2) {
          unint64_t v13 = 3;
        }
        else {
          unint64_t v13 = 2 * (v12 == 1);
        }
        long long v14 = [v10 sectionInfoSettings];
        [v14 setContentPreviewSetting:v13];

        [v3 setObject:v10 forKey:v9];
        long long v15 = (void *)BBLogMigration;
        if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
        {
          long long v16 = @"<unknown>";
          if (v12 <= 2) {
            long long v16 = off_264297028[v12];
          }
          uint64_t v17 = v15;
          uint64_t v18 = BBStringFromBBContentPreviewSetting(v13);
          *(_DWORD *)buf = v19;
          uint64_t v26 = v9;
          __int16 v27 = 2114;
          uint64_t v28 = v16;
          __int16 v29 = 2114;
          uint64_t v30 = v18;
          _os_log_impl(&dword_217675000, v17, OS_LOG_TYPE_DEFAULT, "Migrated content preview setting for sectionId %{public}@. Old: %{public}@ New: %{public}@", buf, 0x20u);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v6);
  }
}

@end