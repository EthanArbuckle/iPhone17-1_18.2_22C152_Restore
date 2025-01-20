@interface BBPersistentStore
- (BBPersistentStore)init;
- (BBPersistentStore)initWithDataDirectoryPath:(id)a3;
- (BOOL)hasSectionInfoLegacyFile;
- (NSString)dataDirectoryPath;
- (id)_clearedSectionsPath;
- (id)_sectionInfoLegacyPath;
- (id)_sectionInfoPath;
- (id)_sectionOrderPath;
- (id)effectiveGlobalScheduledDeliveryTimes;
- (id)readClearedSections;
- (id)readSectionInfo;
- (id)readSectionInfoLegacy;
- (id)readSectionInfoWithVersionNumberForMigration;
- (id)readSectionOrder;
- (int64_t)effectiveGlobalAnnounceCarPlaySetting;
- (int64_t)effectiveGlobalAnnounceHeadphonesSetting;
- (int64_t)effectiveGlobalAnnounceSetting;
- (int64_t)effectiveGlobalContentPreviewsSetting;
- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting;
- (int64_t)effectiveGlobalScheduledDeliverySetting;
- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting;
- (void)deleteSectionInfoFile;
- (void)deleteSectionInfoLegacyFile;
- (void)writeClearedSections:(id)a3;
- (void)writeSectionInfo:(id)a3;
- (void)writeSectionOrder:(id)a3;
@end

@implementation BBPersistentStore

- (BBPersistentStore)initWithDataDirectoryPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBPersistentStore;
  v6 = [(BBPersistentStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataDirectoryPath, a3);
  }

  return v7;
}

- (BBPersistentStore)init
{
  v3 = [@"~/Library/BulletinBoard/" stringByExpandingTildeInPath];
  v4 = [(BBPersistentStore *)self initWithDataDirectoryPath:v3];

  return v4;
}

- (id)readClearedSections
{
  v3 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Reading cleared sections from persistence", v8, 2u);
  }
  v4 = NSDictionary;
  id v5 = [(BBPersistentStore *)self _clearedSectionsPath];
  v6 = [v4 dictionaryWithContentsOfFile:v5];

  return v6;
}

- (id)readSectionInfo
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v3 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Reading BBSectionInfo from persistence", buf, 2u);
  }
  id v24 = [MEMORY[0x263EFF9A0] dictionary];
  context = (void *)MEMORY[0x21D44A020]();
  v4 = NSDictionary;
  id v5 = [(BBPersistentStore *)self _sectionInfoPath];
  v6 = [v4 dictionaryWithContentsOfFile:v5];

  v22 = v6;
  v7 = [v6 objectForKey:@"sectionInfo"];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [v7 allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    uint64_t v25 = *MEMORY[0x263F081D0];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x21D44A020]();
        v14 = [v7 objectForKey:v12];
        id v15 = objc_alloc(MEMORY[0x263F08928]);
        id v28 = 0;
        v16 = (void *)[v15 initForReadingFromData:v14 error:&v28];
        id v17 = v28;
        if (v17) {
          goto LABEL_12;
        }
        [v16 setClass:objc_opt_class() forClassName:@"UNCMuteAssertion"];
        [v16 setClass:objc_opt_class() forClassName:@"UNCSectionIcon"];
        [v16 setClass:objc_opt_class() forClassName:@"UNCSectionIconVariant"];
        [v16 setClass:objc_opt_class() forClassName:@"UNCSectionInfo"];
        [v16 setClass:objc_opt_class() forClassName:@"UNCSectionInfoSettings"];
        [v16 setClass:objc_opt_class() forClassName:@"UNCSectionMuteAssertion"];
        [v16 setClass:objc_opt_class() forClassName:@"UNCThreadsMuteAssertion"];
        uint64_t v18 = objc_opt_class();
        id v27 = 0;
        v19 = [v16 decodeTopLevelObjectOfClass:v18 forKey:v25 error:&v27];
        id v17 = v27;
        if (v19) {
          [v24 setObject:v19 forKey:v12];
        }

        if (v17)
        {
LABEL_12:
          v20 = BBLogPersistence;
          if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v34 = v12;
            __int16 v35 = 2114;
            id v36 = v17;
            _os_log_error_impl(&dword_217675000, v20, OS_LOG_TYPE_ERROR, "Decoding BBSectionInfo for sectionID %{public}@ failed: %{public}@", buf, 0x16u);
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v9);
  }

  return v24;
}

- (id)readSectionInfoLegacy
{
  v3 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Reading legacy SectionInfo from persistence", v8, 2u);
  }
  v4 = NSDictionary;
  id v5 = [(BBPersistentStore *)self _sectionInfoLegacyPath];
  v6 = [v4 dictionaryWithContentsOfFile:v5];

  return v6;
}

- (id)readSectionOrder
{
  v3 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "Reading section order from persistence", v8, 2u);
  }
  v4 = NSDictionary;
  id v5 = [(BBPersistentStore *)self _sectionOrderPath];
  v6 = [v4 dictionaryWithContentsOfFile:v5];

  return v6;
}

- (void)writeClearedSections:(id)a3
{
  id v4 = a3;
  id v5 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Writing cleared sections to persistence", v10, 2u);
  }
  v6 = [MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:200 options:0 error:0];
  v7 = [(BBPersistentStore *)self _clearedSectionsPath];
  char v8 = [v6 writeToFile:v7 options:268435457 error:0];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
      -[BBPersistentStore writeClearedSections:](v9);
    }
  }
}

- (void)writeSectionOrder:(id)a3
{
  id v4 = a3;
  id v5 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "Writing section order to persistence", v10, 2u);
  }
  v6 = [MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:100 options:0 error:0];
  v7 = [(BBPersistentStore *)self _sectionOrderPath];
  char v8 = [v6 writeToFile:v7 options:268435457 error:0];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
      -[BBPersistentStore writeSectionOrder:](v9);
    }
  }
}

- (void)writeSectionInfo:(id)a3
{
  id v28 = self;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a3;
  context = (void *)MEMORY[0x21D44A020]();
  long long v30 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v5, "objectForKey:", v10, v28);
        if (([v11 suppressFromSettings] & 1) == 0)
        {
          uint64_t v12 = (void *)MEMORY[0x21D44A020]();
          v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];
          [v4 setObject:v13 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v7);
  }

  [v30 setObject:v4 forKey:@"sectionInfo"];
  v14 = (void *)BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    uint64_t v16 = [v4 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v38 = v16;
    _os_log_impl(&dword_217675000, v15, OS_LOG_TYPE_DEFAULT, "Writing section info to persistence. Count %lu", buf, 0xCu);
  }
  id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 2, v28);
  [v30 setObject:v17 forKey:@"sectionInfoVersionNumber"];

  uint64_t v18 = [MEMORY[0x263F08AC0] dataWithPropertyList:v30 format:100 options:0 error:0];
  v19 = [v29 _sectionInfoPath];
  id v32 = 0;
  [v18 writeToFile:v19 options:268435457 error:&v32];
  id v20 = v32;

  if (v20)
  {
    v21 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR)) {
      -[BBPersistentStore writeSectionInfo:]((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
}

- (void)deleteSectionInfoFile
{
}

- (void)deleteSectionInfoLegacyFile
{
}

- (BOOL)hasSectionInfoLegacyFile
{
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(BBPersistentStore *)self _sectionInfoLegacyPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (id)_clearedSectionsPath
{
  return [(NSString *)self->_dataDirectoryPath stringByAppendingPathComponent:@"ClearedSections.plist"];
}

- (id)_sectionOrderPath
{
  return [(NSString *)self->_dataDirectoryPath stringByAppendingPathComponent:@"SectionOrder.plist"];
}

- (id)_sectionInfoPath
{
  return [(NSString *)self->_dataDirectoryPath stringByAppendingPathComponent:@"VersionedSectionInfo.plist"];
}

- (id)_sectionInfoLegacyPath
{
  return [(NSString *)self->_dataDirectoryPath stringByAppendingPathComponent:@"SectionInfo.plist"];
}

- (id)readSectionInfoWithVersionNumberForMigration
{
  v2 = NSDictionary;
  id v3 = [(BBPersistentStore *)self _sectionInfoPath];
  id v4 = [v2 dictionaryWithContentsOfFile:v3];

  return v4;
}

- (int64_t)effectiveGlobalAnnounceCarPlaySetting
{
  return 0;
}

- (int64_t)effectiveGlobalAnnounceHeadphonesSetting
{
  return 0;
}

- (int64_t)effectiveGlobalAnnounceSetting
{
  return 0;
}

- (int64_t)effectiveGlobalContentPreviewsSetting
{
  return 0;
}

- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting
{
  return 0;
}

- (int64_t)effectiveGlobalScheduledDeliverySetting
{
  return 0;
}

- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting
{
  return 0;
}

- (id)effectiveGlobalScheduledDeliveryTimes
{
  return (id)MEMORY[0x263EFFA68];
}

- (NSString)dataDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

- (void)writeClearedSections:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217675000, log, OS_LOG_TYPE_ERROR, "Error writing cleared sections data.", v1, 2u);
}

- (void)writeSectionOrder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217675000, log, OS_LOG_TYPE_ERROR, "Error writing section order data.", v1, 2u);
}

- (void)writeSectionInfo:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end