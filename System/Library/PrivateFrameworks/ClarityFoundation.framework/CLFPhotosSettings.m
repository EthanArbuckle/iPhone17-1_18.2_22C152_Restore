@interface CLFPhotosSettings
- (id)selectedSharedAlbumCloudIdentifiers;
- (void)_migrateSelectedSharedAlbumNamesIfNecessary;
- (void)_saveSelectedSharedAlbumCloudIdentifiersForNames:(id)a3;
@end

@implementation CLFPhotosSettings

- (id)selectedSharedAlbumCloudIdentifiers
{
  [(CLFPhotosSettings *)self _migrateSelectedSharedAlbumNamesIfNecessary];
  v5.receiver = self;
  v5.super_class = (Class)CLFPhotosSettings;
  v3 = [(CLFPhotosSettings_GeneratedCode *)&v5 selectedSharedAlbumCloudIdentifiers];
  return v3;
}

- (void)_migrateSelectedSharedAlbumNamesIfNecessary
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [(AXBaseSettings *)self objectValueForPreferenceKey:@"SelectedSharedAlbums" ofClass:objc_opt_class() defaultValue:0];
  if ([v3 count])
  {
    v4 = +[CLFLog commonLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      uint64_t v7 = [v3 count];
      _os_log_impl(&dword_217F54000, v4, OS_LOG_TYPE_DEFAULT, "Migrating %lu shared photo album name(s).", (uint8_t *)&v6, 0xCu);
    }

    [(CLFPhotosSettings *)self _saveSelectedSharedAlbumCloudIdentifiersForNames:v3];
LABEL_9:
    [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"SelectedSharedAlbums"];
    goto LABEL_10;
  }
  if (v3)
  {
    objc_super v5 = +[CLFLog commonLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_217F54000, v5, OS_LOG_TYPE_DEFAULT, "Removing empty shared photo album names.", (uint8_t *)&v6, 2u);
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)_saveSelectedSharedAlbumCloudIdentifiersForNames:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2050000000;
  objc_super v5 = (void *)getPHAssetCollectionClass_softClass;
  uint64_t v46 = getPHAssetCollectionClass_softClass;
  if (!getPHAssetCollectionClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getPHAssetCollectionClass_block_invoke;
    v50 = &unk_2642F3758;
    v51 = &v43;
    __getPHAssetCollectionClass_block_invoke((uint64_t)buf);
    objc_super v5 = (void *)v44[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v43, 8);
  uint64_t v7 = [v6 fetchAssetCollectionsWithType:1 subtype:101 options:0];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __81__CLFPhotosSettings_Migration___saveSelectedSharedAlbumCloudIdentifiersForNames___block_invoke;
  v41[3] = &unk_2642F3730;
  id v8 = v4;
  id v42 = v8;
  [v7 enumerateObjectsUsingBlock:v41];

  v32 = [MEMORY[0x263EFF980] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v3;
  uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        v13 = [v8 objectForKeyedSubscript:v12];
        if ([v13 length])
        {
          [v32 addObject:v13];
        }
        else
        {
          v14 = +[CLFLog commonLog];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138477827;
            *(void *)&buf[4] = v12;
            _os_log_error_impl(&dword_217F54000, v14, OS_LOG_TYPE_ERROR, "Unable to get local identifier for shared album name: %{private}@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v48 count:16];
    }
    while (v9);
  }

  v30 = [MEMORY[0x263EFF980] array];
  if ([v32 count])
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2050000000;
    v15 = (void *)getPHPhotoLibraryClass_softClass;
    uint64_t v46 = getPHPhotoLibraryClass_softClass;
    if (!getPHPhotoLibraryClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getPHPhotoLibraryClass_block_invoke;
      v50 = &unk_2642F3758;
      v51 = &v43;
      __getPHPhotoLibraryClass_block_invoke((uint64_t)buf);
      v15 = (void *)v44[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v43, 8);
    v17 = [v16 sharedPhotoLibrary];
    v18 = [v17 cloudIdentifierMappingsForLocalIdentifiers:v32];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v47 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          v24 = [v19 objectForKeyedSubscript:v23];
          v25 = [v24 cloudIdentifier];
          v26 = [v25 stringValue];

          if ([v26 length])
          {
            [v30 addObject:v26];
          }
          else
          {
            v27 = +[CLFLog commonLog];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v28 = [v24 error];
              *(_DWORD *)buf = 138478083;
              *(void *)&buf[4] = v23;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v28;
              _os_log_error_impl(&dword_217F54000, v27, OS_LOG_TYPE_ERROR, "Unable to get cloud identifier for shared album with local identifier: %{private}@, error: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v47 count:16];
      }
      while (v20);
    }
  }
  [(CLFPhotosSettings_GeneratedCode *)self setSelectedSharedAlbumCloudIdentifiers:v30];
}

void __81__CLFPhotosSettings_Migration___saveSelectedSharedAlbumCloudIdentifiersForNames___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 localizedTitle];
  if ([v3 length])
  {
    v4 = [v5 localIdentifier];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }
}

uint64_t __49__CLFPhotosSettings_GeneratedCode_sharedInstance__block_invoke()
{
  sharedInstance_SharedSettings_4 = objc_alloc_init(CLFPhotosSettings);
  return MEMORY[0x270F9A758]();
}

@end