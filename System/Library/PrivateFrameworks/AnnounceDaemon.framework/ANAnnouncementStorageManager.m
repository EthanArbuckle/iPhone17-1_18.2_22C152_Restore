@interface ANAnnouncementStorageManager
+ (id)sharedManager;
- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 removingItemAtURL:(id)a5;
- (NSFileManager)fileManager;
- (NSUserDefaults)defaults;
- (id)_announcementDataDirectoryForType:(id)a3 endpointID:(id)a4 error:(id *)a5;
- (id)_baseDirectoryURLForEndpointID:(id)a3 error:(id *)a4;
- (id)_cachesURLWithError:(id *)a3;
- (id)_saveAudioDataForAnnouncement:(id)a3 endpointID:(id)a4;
- (id)storedAnnouncementsForEndpointID:(id)a3;
- (void)_removeAudioDataForAnnouncementID:(id)a3 endpointID:(id)a4;
- (void)_removeDirectoryForEndpointsExcludingEndpointIDs:(id)a3;
- (void)_removeMetadataForAnnouncementID:(id)a3 endpointID:(id)a4;
- (void)_saveMetadataForAnnouncement:(id)a3 endpointID:(id)a4;
- (void)deleteAnnouncementWithID:(id)a3 endpointID:(id)a4;
- (void)deleteAnnouncementsExcludingAnnouncementsForEndpointIDs:(id)a3;
- (void)removeAnnouncementDataExcludingDataForAnnouncementIDs:(id)a3 endpointID:(id)a4;
- (void)saveAnnouncement:(id)a3 endpointID:(id)a4;
- (void)setFileManager:(id)a3;
@end

@implementation ANAnnouncementStorageManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ANAnnouncementStorageManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __45__ANAnnouncementStorageManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = v0;

  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.announce.announcements"];
  v3 = *(void **)(sharedManager_manager + 8);
  *(void *)(sharedManager_manager + 8) = v2;

  uint64_t v4 = objc_opt_new();
  v5 = *(void **)(sharedManager_manager + 16);
  *(void *)(sharedManager_manager + 16) = v4;

  v6 = *(void **)(sharedManager_manager + 16);
  return objc_msgSend(v6, "setDelegate:");
}

- (id)storedAnnouncementsForEndpointID:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  uint64_t v4 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v5 = [v4 BOOLForDefault:*MEMORY[0x1E4F4A628]];

  if (v5)
  {
    v6 = ANLogHandleAnnouncementStorageManager();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v36 = &stru_1F34A0E10;
      __int16 v37 = 2112;
      id v38 = v29;
      _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "%@Loading Announcements from Metadata for EndpontID: %@", buf, 0x16u);
    }

    v7 = [v29 UUIDString];
    v8 = [(ANAnnouncementStorageManager *)self defaults];
    v9 = [v8 dictionaryForKey:v7];

    if (v9)
    {
      v27 = v9;
      v28 = v7;
      v10 = [v9 allValues];
      v11 = objc_msgSend(v10, "na_map:", &__block_literal_global_11);

      v12 = [MEMORY[0x1E4F1CA48] arrayWithArray:v11];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v19 = [(ANAnnouncementStorageManager *)self fileManager];
            v20 = [v18 filePath];
            char v21 = [v19 fileExistsAtPath:v20];

            if ((v21 & 1) == 0)
            {
              v22 = [v18 identifier];
              [(ANAnnouncementStorageManager *)self deleteAnnouncementWithID:v22 endpointID:v29];

              v23 = ANLogHandleAnnouncementStorageManager();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                v24 = [v18 identifier];
                *(_DWORD *)buf = 138412546;
                v36 = &stru_1F34A0E10;
                __int16 v37 = 2112;
                id v38 = v24;
                _os_log_impl(&dword_1DA5ED000, v23, OS_LOG_TYPE_DEFAULT, "%@Deleting Announcement missing Audio Data on disk: %@", buf, 0x16u);
              }
              [v12 removeObject:v18];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v15);
      }

      v25 = (void *)[v12 copy];
      v9 = v27;
      v7 = v28;
    }
    else
    {
      v13 = ANLogHandleAnnouncementStorageManager();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v36 = &stru_1F34A0E10;
        __int16 v37 = 2112;
        id v38 = v29;
        _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@No Announcements found for Endpoint %@", buf, 0x16u);
      }
      v25 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v25;
}

id __65__ANAnnouncementStorageManager_storedAnnouncementsForEndpointID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F4A8A8];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithMessage:v3];

  return v4;
}

- (void)saveAnnouncement:(id)a3 endpointID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(ANAnnouncementStorageManager *)self _saveAudioDataForAnnouncement:v10 endpointID:v6];
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    int v9 = [v8 BOOLForDefault:*MEMORY[0x1E4F4A628]];

    if (v9) {
      [(ANAnnouncementStorageManager *)self _saveMetadataForAnnouncement:v10 endpointID:v6];
    }
  }
}

- (void)deleteAnnouncementWithID:(id)a3 endpointID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  char v8 = [v7 BOOLForDefault:*MEMORY[0x1E4F4A670]];

  if ((v8 & 1) == 0) {
    [(ANAnnouncementStorageManager *)self _removeAudioDataForAnnouncementID:v11 endpointID:v6];
  }
  int v9 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v10 = [v9 BOOLForDefault:*MEMORY[0x1E4F4A628]];

  if (v10) {
    [(ANAnnouncementStorageManager *)self _removeMetadataForAnnouncementID:v11 endpointID:v6];
  }
}

- (void)deleteAnnouncementsExcludingAnnouncementsForEndpointIDs:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = ANLogHandleAnnouncementStorageManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = &stru_1F34A0E10;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@Scrubbing stored announcements excluding: %@", buf, 0x16u);
  }

  id v6 = [(ANAnnouncementStorageManager *)self defaults];
  v7 = [v6 dictionaryRepresentation];
  char v8 = [v7 allKeys];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
        id v15 = objc_alloc(MEMORY[0x1E4F29128]);
        uint64_t v16 = objc_msgSend(v15, "initWithUUIDString:", v14, (void)v18);
        if (v16 && ([v4 containsObject:v16] & 1) == 0)
        {
          v17 = [(ANAnnouncementStorageManager *)self defaults];
          [v17 removeObjectForKey:v14];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  [(ANAnnouncementStorageManager *)self _removeDirectoryForEndpointsExcludingEndpointIDs:v4];
}

- (void)removeAnnouncementDataExcludingDataForAnnouncementIDs:(id)a3 endpointID:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v47 = 0;
  v7 = [(ANAnnouncementStorageManager *)self _announcementDataDirectoryForType:@"received" endpointID:a4 error:&v47];
  id v8 = v47;
  if (v7)
  {
    id v9 = [(ANAnnouncementStorageManager *)self fileManager];
    id v46 = v8;
    uint64_t v10 = [v9 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:0 error:&v46];
    uint64_t v11 = (char *)v46;

    uint64_t v12 = ANLogHandleAnnouncementStorageManager();
    uint64_t v13 = v12;
    if (v10)
    {
      id v38 = v11;
      uint64_t v39 = self;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v49 = &stru_1F34A0E10;
        __int16 v50 = 2112;
        v51 = v7;
        _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@Cleaning Announcement Data in: %@", buf, 0x16u);
      }
      __int16 v37 = v7;

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v10 = v10;
      uint64_t v14 = [v10 countByEnumeratingWithState:&v42 objects:v56 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v43;
        do
        {
          uint64_t v17 = 0;
          uint64_t v40 = v15;
          do
          {
            if (*(void *)v43 != v16) {
              objc_enumerationMutation(v10);
            }
            long long v18 = *(char **)(*((void *)&v42 + 1) + 8 * v17);
            long long v19 = ANLogHandleAnnouncementStorageManager();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v49 = &stru_1F34A0E10;
              __int16 v50 = 2112;
              v51 = v18;
              _os_log_impl(&dword_1DA5ED000, v19, OS_LOG_TYPE_DEFAULT, "%@Checking item %@", buf, 0x16u);
            }

            long long v20 = [v18 URLByDeletingPathExtension];
            long long v21 = [v20 lastPathComponent];

            v22 = [v21 componentsSeparatedByString:@"--"];
            v23 = [v22 objectAtIndexedSubscript:0];

            if (([v6 containsObject:v23] & 1) == 0)
            {
              uint64_t v24 = v16;
              __int16 v25 = v10;
              id v26 = v6;
              uint64_t v27 = ANLogHandleAnnouncementStorageManager();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v49 = &stru_1F34A0E10;
                __int16 v50 = 2112;
                v51 = v18;
                _os_log_impl(&dword_1DA5ED000, v27, OS_LOG_TYPE_DEFAULT, "%@Removing item %@", buf, 0x16u);
              }

              v28 = [(ANAnnouncementStorageManager *)v39 fileManager];
              id v41 = 0;
              char v29 = [v28 removeItemAtURL:v18 error:&v41];
              id v30 = v41;

              long long v31 = ANLogHandleAnnouncementStorageManager();
              long long v32 = v31;
              if (v29)
              {
                id v6 = v26;
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  v49 = &stru_1F34A0E10;
                  __int16 v50 = 2080;
                  v51 = "-[ANAnnouncementStorageManager removeAnnouncementDataExcludingDataForAnnouncementIDs:endpointID:]";
                  __int16 v52 = 2112;
                  v53 = v18;
                  long long v33 = v32;
                  os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
                  v35 = "%@%s Successfully removed item %@";
                  uint32_t v36 = 32;
                  goto LABEL_20;
                }
              }
              else
              {
                id v6 = v26;
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138413058;
                  v49 = &stru_1F34A0E10;
                  __int16 v50 = 2080;
                  v51 = "-[ANAnnouncementStorageManager removeAnnouncementDataExcludingDataForAnnouncementIDs:endpointID:]";
                  __int16 v52 = 2112;
                  v53 = v18;
                  __int16 v54 = 2112;
                  v55 = v38;
                  long long v33 = v32;
                  os_log_type_t v34 = OS_LOG_TYPE_ERROR;
                  v35 = "%@%s Failed to remove item: %@, Error = %@";
                  uint32_t v36 = 42;
LABEL_20:
                  _os_log_impl(&dword_1DA5ED000, v33, v34, v35, buf, v36);
                }
              }

              uint64_t v10 = v25;
              uint64_t v16 = v24;
              uint64_t v15 = v40;
            }

            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v10 countByEnumeratingWithState:&v42 objects:v56 count:16];
        }
        while (v15);
      }

      v7 = v37;
      uint64_t v11 = v38;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v49 = &stru_1F34A0E10;
        __int16 v50 = 2112;
        v51 = v11;
        _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_ERROR, "%@Failed to get contents of directory: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v10 = ANLogHandleAnnouncementStorageManager();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v49 = &stru_1F34A0E10;
      __int16 v50 = 2112;
      v51 = (const char *)v8;
      _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_ERROR, "%@Failed to get Directory for saved announcements. %@", buf, 0x16u);
    }
    uint64_t v11 = (char *)v8;
  }
}

- (void)_saveMetadataForAnnouncement:(id)a3 endpointID:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = ANLogHandleAnnouncementStorageManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(ANAnnouncementStorageManager *)self defaults];
    int v22 = 138412546;
    v23 = &stru_1F34A0E10;
    __int16 v24 = 2112;
    __int16 v25 = v9;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@Saving Announcement Metadata to %@", (uint8_t *)&v22, 0x16u);
  }
  uint64_t v10 = [v6 UUIDString];

  uint64_t v11 = ANLogHandleAnnouncementStorageManager();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    v23 = &stru_1F34A0E10;
    __int16 v24 = 2112;
    __int16 v25 = v10;
    _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "%@Key: %@", (uint8_t *)&v22, 0x16u);
  }

  uint64_t v12 = [(ANAnnouncementStorageManager *)self defaults];
  uint64_t v13 = [v12 dictionaryForKey:v10];
  uint64_t v14 = (void *)v13;
  uint64_t v15 = (void *)MEMORY[0x1E4F1CC08];
  if (v13) {
    uint64_t v15 = (void *)v13;
  }
  id v16 = v15;

  uint64_t v17 = (void *)[v16 mutableCopy];
  long long v18 = [v7 metadata];
  long long v19 = [v7 identifier];

  [v17 setObject:v18 forKeyedSubscript:v19];
  long long v20 = [(ANAnnouncementStorageManager *)self defaults];
  long long v21 = (void *)[v17 copy];
  [v20 setObject:v21 forKey:v10];
}

- (id)_saveAudioDataForAnnouncement:(id)a3 endpointID:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v30 = 0;
  id v8 = [(ANAnnouncementStorageManager *)self _announcementDataDirectoryForType:@"received" endpointID:v7 error:&v30];
  id v9 = v30;
  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = [v6 identifier];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F4A940], "an_dateFormatterForFilename");
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v15 = [v13 stringFromDate:v14];
    id v16 = [v11 stringWithFormat:@"%@--%@", v12, v15];

    uint64_t v17 = [v8 URLByAppendingPathComponent:v16];
    long long v18 = [v17 URLByAppendingPathExtension:@"caf"];

    long long v19 = ANLogHandleAnnouncementStorageManager();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = [v6 fileData];
      uint64_t v21 = [v20 length];
      *(_DWORD *)buf = 138412802;
      long long v32 = &stru_1F34A0E10;
      __int16 v33 = 2112;
      id v34 = v18;
      __int16 v35 = 2048;
      uint64_t v36 = v21;
      _os_log_impl(&dword_1DA5ED000, v19, OS_LOG_TYPE_DEFAULT, "%@Saving to URL: %@, Size: %lu", buf, 0x20u);
    }
    int v22 = [v6 fileData];
    id v29 = v10;
    char v23 = [v22 writeToURL:v18 options:1 error:&v29];
    id v24 = v29;

    if (v23)
    {
      __int16 v25 = [v18 path];
      [v6 setFilePath:v25];
    }
    else
    {
      uint64_t v26 = ANLogHandleAnnouncementStorageManager();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        long long v32 = &stru_1F34A0E10;
        __int16 v33 = 2112;
        id v34 = v24;
        _os_log_impl(&dword_1DA5ED000, v26, OS_LOG_TYPE_ERROR, "%@Failed to write data: %@", buf, 0x16u);
      }

      __int16 v25 = +[ANAnalytics shared];
      uint64_t v27 = +[ANAnalyticsContext contextWithEndpointID:v7];
      [v25 error:5009 context:v27];
    }
  }
  else
  {
    id v24 = v9;
  }

  return v24;
}

- (void)_removeAudioDataForAnnouncementID:(id)a3 endpointID:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v39 = 0;
  id v8 = [(ANAnnouncementStorageManager *)self _announcementDataDirectoryForType:@"received" endpointID:v7 error:&v39];
  id v9 = v39;
  uint64_t v10 = [(ANAnnouncementStorageManager *)self fileManager];
  id v38 = v9;
  uint64_t v11 = [v10 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:0 error:&v38];
  id v12 = v38;

  if (v11)
  {
    id v29 = self;
    id v30 = v7;
    long long v31 = v12;
    long long v32 = v11;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v19 = ANLogHandleAnnouncementStorageManager();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v41 = &stru_1F34A0E10;
            __int16 v42 = 2112;
            id v43 = v18;
            _os_log_impl(&dword_1DA5ED000, v19, OS_LOG_TYPE_DEFAULT, "%@Checking item %@", buf, 0x16u);
          }

          long long v20 = [v18 URLByDeletingPathExtension];
          uint64_t v21 = [v20 lastPathComponent];

          int v22 = [v21 componentsSeparatedByString:@"--"];
          char v23 = [v22 objectAtIndexedSubscript:0];

          if ([v6 isEqualToString:v23])
          {
            id v24 = [(ANAnnouncementStorageManager *)v29 fileManager];
            id v33 = v31;
            char v25 = [v24 removeItemAtURL:v18 error:&v33];
            id v12 = v33;

            uint64_t v26 = ANLogHandleAnnouncementStorageManager();
            uint64_t v27 = v26;
            if (v25)
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                id v41 = &stru_1F34A0E10;
                __int16 v42 = 2112;
                id v43 = v18;
                __int16 v44 = 2112;
                id v45 = v6;
                _os_log_impl(&dword_1DA5ED000, v27, OS_LOG_TYPE_DEFAULT, "%@Removed file (%@) for AnnouncementID (%@)", buf, 0x20u);
              }
              id v7 = v30;
            }
            else
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                id v41 = &stru_1F34A0E10;
                __int16 v42 = 2112;
                id v43 = v18;
                __int16 v44 = 2112;
                id v45 = v12;
                _os_log_impl(&dword_1DA5ED000, v27, OS_LOG_TYPE_ERROR, "%@Failed to remove file (%@): %@", buf, 0x20u);
              }

              uint64_t v27 = +[ANAnalytics shared];
              id v7 = v30;
              v28 = +[ANAnalyticsContext contextWithEndpointID:v30];
              [v27 error:5010 context:v28];
            }
            goto LABEL_25;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v46 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    uint64_t v13 = ANLogHandleAnnouncementStorageManager();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = &stru_1F34A0E10;
      __int16 v42 = 2112;
      id v43 = v6;
      _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@File does not exist for %@. Nothing to delete.", buf, 0x16u);
    }
    id v7 = v30;
    id v12 = v31;
LABEL_25:
    uint64_t v11 = v32;
  }
  else
  {
    uint64_t v13 = ANLogHandleAnnouncementStorageManager();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = &stru_1F34A0E10;
      __int16 v42 = 2112;
      id v43 = v12;
      _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_ERROR, "%@Failed to get contents of directory: %@", buf, 0x16u);
    }
  }
}

- (void)_removeMetadataForAnnouncementID:(id)a3 endpointID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 UUIDString];
  id v9 = [(ANAnnouncementStorageManager *)self defaults];
  uint64_t v10 = [v9 dictionaryForKey:v8];

  if (v10)
  {
    uint64_t v11 = [v10 mutableCopy];
    [v11 setObject:0 forKeyedSubscript:v6];
    id v12 = ANLogHandleAnnouncementStorageManager();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      uint64_t v16 = &stru_1F34A0E10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1DA5ED000, v12, OS_LOG_TYPE_DEFAULT, "%@Removed Announcement Metadata: %@", (uint8_t *)&v15, 0x16u);
    }

    uint64_t v13 = [(ANAnnouncementStorageManager *)self defaults];
    id v14 = [v11 copy];
    [v13 setObject:v14 forKey:v8];
  }
  else
  {
    uint64_t v11 = ANLogHandleAnnouncementStorageManager();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      uint64_t v16 = &stru_1F34A0E10;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "%@No Announcements found for Endpoint %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_removeDirectoryForEndpointsExcludingEndpointIDs:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v40 = 0;
  int v5 = [(ANAnnouncementStorageManager *)self _cachesURLWithError:&v40];
  id v6 = v40;
  if (v5)
  {
    id v7 = [(ANAnnouncementStorageManager *)self fileManager];
    id v39 = v6;
    id v8 = [v7 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:0 error:&v39];
    id v9 = (char *)v39;

    uint64_t v10 = ANLogHandleAnnouncementStorageManager();
    uint64_t v11 = v10;
    if (v8)
    {
      long long v32 = v9;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v5 absoluteString];
        *(_DWORD *)buf = 138412546;
        __int16 v42 = &stru_1F34A0E10;
        __int16 v43 = 2112;
        __int16 v44 = v12;
        _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "%@Cleaning Items in: %@", buf, 0x16u);
      }
      id v30 = v5;

      id v31 = v4;
      uint64_t v11 = objc_msgSend(v4, "na_map:", &__block_literal_global_36);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v29 = v8;
      id obj = v8;
      uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v36 != v15) {
              objc_enumerationMutation(obj);
            }
            __int16 v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            id v18 = [v17 lastPathComponent];
            if (([v11 containsObject:v18] & 1) == 0)
            {
              uint64_t v19 = ANLogHandleAnnouncementStorageManager();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                __int16 v42 = &stru_1F34A0E10;
                __int16 v43 = 2112;
                __int16 v44 = (const char *)v17;
                _os_log_impl(&dword_1DA5ED000, v19, OS_LOG_TYPE_DEFAULT, "%@Removing item %@", buf, 0x16u);
              }

              id v34 = 0;
              long long v20 = v7;
              char v21 = [v7 removeItemAtURL:v17 error:&v34];
              id v22 = v34;
              char v23 = ANLogHandleAnnouncementStorageManager();
              id v24 = v23;
              if (v21)
              {
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  __int16 v42 = &stru_1F34A0E10;
                  __int16 v43 = 2080;
                  __int16 v44 = "-[ANAnnouncementStorageManager _removeDirectoryForEndpointsExcludingEndpointIDs:]";
                  __int16 v45 = 2112;
                  id v46 = v17;
                  char v25 = v24;
                  os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
                  uint64_t v27 = "%@%s Successfully removed item: %@";
                  uint32_t v28 = 32;
                  goto LABEL_18;
                }
              }
              else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138413058;
                __int16 v42 = &stru_1F34A0E10;
                __int16 v43 = 2080;
                __int16 v44 = "-[ANAnnouncementStorageManager _removeDirectoryForEndpointsExcludingEndpointIDs:]";
                __int16 v45 = 2112;
                id v46 = v17;
                __int16 v47 = 2112;
                v48 = v32;
                char v25 = v24;
                os_log_type_t v26 = OS_LOG_TYPE_ERROR;
                uint64_t v27 = "%@%s Failed to remove item: %@, Error = %@";
                uint32_t v28 = 42;
LABEL_18:
                _os_log_impl(&dword_1DA5ED000, v25, v26, v27, buf, v28);
              }

              id v7 = v20;
            }
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
        }
        while (v14);
      }

      int v5 = v30;
      id v4 = v31;
      id v9 = v32;
      id v8 = v29;
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v42 = &stru_1F34A0E10;
      __int16 v43 = 2112;
      __int16 v44 = v9;
      _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_ERROR, "%@Failed to get contents of caches directory: %@", buf, 0x16u);
    }
  }
  else
  {
    id v7 = ANLogHandleAnnouncementStorageManager();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v42 = &stru_1F34A0E10;
      __int16 v43 = 2112;
      __int16 v44 = (const char *)v6;
      _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_ERROR, "%@Did not find Caches URL %@", buf, 0x16u);
    }
    id v9 = (char *)v6;
  }
}

uint64_t __81__ANAnnouncementStorageManager__removeDirectoryForEndpointsExcludingEndpointIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (id)_announcementDataDirectoryForType:(id)a3 endpointID:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(ANAnnouncementStorageManager *)self fileManager];
  uint64_t v11 = [(ANAnnouncementStorageManager *)self _baseDirectoryURLForEndpointID:v9 error:a5];
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 URLByAppendingPathComponent:v8];
    uint64_t v14 = [v13 absoluteString];
    char v15 = [v10 fileExistsAtPath:v14];

    if ((v15 & 1) != 0
      || ([v10 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:a5] & 1) != 0)
    {
      uint64_t v13 = v13;
      uint64_t v16 = v13;
      goto LABEL_11;
    }
    id v18 = ANLogHandleAnnouncementStorageManager();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = *a5;
      int v21 = 138412802;
      id v22 = &stru_1F34A0E10;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl(&dword_1DA5ED000, v18, OS_LOG_TYPE_ERROR, "%@Failed to create directory for type: %@, %@", (uint8_t *)&v21, 0x20u);
    }
  }
  else
  {
    uint64_t v13 = ANLogHandleAnnouncementStorageManager();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v17 = *a5;
      int v21 = 138412802;
      id v22 = &stru_1F34A0E10;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_ERROR, "%@Did not find directory for endpoint ID %@, %@", (uint8_t *)&v21, 0x20u);
    }
  }
  uint64_t v16 = 0;
LABEL_11:

  return v16;
}

- (id)_baseDirectoryURLForEndpointID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ANAnnouncementStorageManager *)self _cachesURLWithError:a4];
  id v8 = [v6 UUIDString];

  id v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:1];

  return v9;
}

- (id)_cachesURLWithError:(id *)a3
{
  id v4 = [(ANAnnouncementStorageManager *)self fileManager];
  int v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:a3];

  if (!v5)
  {
    id v6 = +[ANAnalytics shared];
    [v6 error:5011];
  }
  id v7 = [v5 URLByAppendingPathComponent:@"com.apple.announce" isDirectory:1];

  return v7;
}

- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 removingItemAtURL:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(ANAnnouncementStorageManager *)self fileManager];

  if (v9 == v8)
  {
    uint64_t v10 = ANLogHandleAnnouncementStorageManager();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      uint64_t v13 = &stru_1F34A0E10;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%@Remove Item At URL Error = %@. Proceeding.", (uint8_t *)&v12, 0x16u);
    }
  }
  return v9 == v8;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end