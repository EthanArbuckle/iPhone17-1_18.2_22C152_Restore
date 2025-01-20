@interface AVTStickerRecentsMigrator
- (AVTAvatarStoreInternal)store;
- (AVTStickerConfigurationProvider)stickerConfigurationProvider;
- (AVTStickerRecentsMigrator)initWithStore:(id)a3 stickerConfigurationProvider:(id)a4 environment:(id)a5;
- (AVTUILogger)logger;
- (BOOL)migrationHasBeenPerformed;
- (void)performMigrationIfNeeded;
- (void)setLogger:(id)a3;
- (void)setMigrationHasBeenPerformed:(BOOL)a3;
- (void)setNeedsMigrationOnNextLaunch;
- (void)setStickerConfigurationProvider:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation AVTStickerRecentsMigrator

- (AVTStickerRecentsMigrator)initWithStore:(id)a3 stickerConfigurationProvider:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTStickerRecentsMigrator;
  v12 = [(AVTStickerRecentsMigrator *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_storeStrong((id *)&v13->_stickerConfigurationProvider, a4);
    v13->_logger = (AVTUILogger *)(id)[v11 logger];
  }

  return v13;
}

- (void)performMigrationIfNeeded
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  if (!self->_migrationHasBeenPerformed && AVTUIStickerRecentsMigrationVersion() <= 1)
  {
    uint64_t v3 = [MEMORY[0x263F29760] requestForAllRecentStickers];
    store = self->_store;
    uint64_t v65 = 0;
    v48 = (void *)v3;
    v5 = -[AVTAvatarStoreInternal recentStickersForFetchRequest:error:](store, "recentStickersForFetchRequest:error:");
    id v6 = 0;
    id v7 = v6;
    if (v6)
    {
      logger = self->_logger;
      id v9 = [v6 localizedDescription];
      [(AVTUILogger *)logger logErrorFetchingRecentStickers:v9];
    }
    v47 = v7;
    uint64_t v10 = [MEMORY[0x263F29718] requestForAllAvatars];
    id v11 = self->_store;
    id v64 = 0;
    v46 = (void *)v10;
    v12 = -[AVTAvatarStoreInternal avatarsForFetchRequest:error:](v11, "avatarsForFetchRequest:error:");
    id v45 = v64;
    v13 = [MEMORY[0x263EFF9A0] dictionary];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v61 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          v20 = [v19 identifier];
          [v13 setObject:v19 forKeyedSubscript:v20];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v60 objects:v68 count:16];
      }
      while (v16);
    }
    v49 = self;
    id v44 = v14;

    v51 = [MEMORY[0x263EFF9A0] dictionary];
    v21 = [MEMORY[0x263EFF980] array];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    obuint64_t j = v5;
    uint64_t v22 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v57 != v24) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          v27 = objc_msgSend(v26, "avatarRecordIdentifier", v44);
          v28 = [v13 objectForKeyedSubscript:v27];

          if (v28)
          {
            v29 = [v26 avatarRecordIdentifier];
            v30 = [v51 objectForKeyedSubscript:v29];

            if (!v30)
            {
              v30 = [(AVTStickerConfigurationProvider *)v49->_stickerConfigurationProvider availableStickerNamesForAvatarRecord:v28];
              v31 = [v26 avatarRecordIdentifier];
              [v51 setObject:v30 forKeyedSubscript:v31];
            }
            v32 = [v26 stickerConfigurationIdentifier];
            char v33 = [v30 containsObject:v32];

            if ((v33 & 1) == 0) {
              [v21 addObject:v26];
            }
          }
          else
          {
            [v21 addObject:v26];
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
      }
      while (v23);
    }

    -[AVTUILogger logPerformedRecentStickersMigration:](v49->_logger, "logPerformedRecentStickersMigration:", [v21 count] != 0);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v34 = v21;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v52 objects:v66 count:16];
    v36 = v44;
    if (v35)
    {
      uint64_t v37 = v35;
      uint64_t v38 = *(void *)v53;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v53 != v38) {
            objc_enumerationMutation(v34);
          }
          v40 = *(void **)(*((void *)&v52 + 1) + 8 * k);
          v41 = v49->_store;
          v42 = objc_msgSend(v40, "avatarRecordIdentifier", v44);
          v43 = [v40 stickerConfigurationIdentifier];
          [(AVTAvatarStoreInternal *)v41 deleteRecentStickersWithAvatarIdentifier:v42 stickerIdentifier:v43 completionHandler:0];
        }
        uint64_t v37 = [v34 countByEnumeratingWithState:&v52 objects:v66 count:16];
      }
      while (v37);
    }

    AVTUISetStickerRecentsMigrationVersion();
    v49->_migrationHasBeenPerformed = 1;
  }
}

- (void)setNeedsMigrationOnNextLaunch
{
  self->_migrationHasBeenPerformed = 0;
  AVTUISetStickerRecentsMigrationVersion();
}

- (AVTAvatarStoreInternal)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (AVTStickerConfigurationProvider)stickerConfigurationProvider
{
  return self->_stickerConfigurationProvider;
}

- (void)setStickerConfigurationProvider:(id)a3
{
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  self->_logger = (AVTUILogger *)a3;
}

- (BOOL)migrationHasBeenPerformed
{
  return self->_migrationHasBeenPerformed;
}

- (void)setMigrationHasBeenPerformed:(BOOL)a3
{
  self->_migrationHasBeenPerformed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end