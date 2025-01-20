@interface APConfigurationResponseHandler
- (APConfigurationResponseHandler)init;
- (APUnfairLock)lock;
- (BOOL)_copyCurrentConfigToTraverse;
- (BOOL)_createTempDirectory;
- (BOOL)_isCancelled;
- (BOOL)_removeTempDirectory;
- (BOOL)_replaceConfigWithNewHierarchy;
- (BOOL)_testingFlag;
- (BOOL)_writeCompressedFileWithData:(id)a3 atPath:(id)a4;
- (BOOL)cancelled;
- (BOOL)processResponseWithData:(id)a3;
- (NSFileManager)fileManager;
- (NSString)pathToConfig;
- (NSString)pathToTempDir;
- (NSString)pathToTraverse;
- (id)_tempConfigPath;
- (int64_t)_configurationVersion;
- (int64_t)_processData:(id)a3;
- (int64_t)_traverseDirectoryAtPath:(id)a3 replacingConfigurationAtPath:(id)a4;
- (void)_sendCoreAnalyticsWithUpdateStatus:(int64_t)a3 version:(int64_t)a4;
- (void)cancelProcess;
- (void)setCancelled:(BOOL)a3;
- (void)setLock:(id)a3;
@end

@implementation APConfigurationResponseHandler

- (APConfigurationResponseHandler)init
{
  v23.receiver = self;
  v23.super_class = (Class)APConfigurationResponseHandler;
  v4 = [(APConfigurationResponseHandler *)&v23 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v2, v3);
    fileManager = v4->_fileManager;
    v4->_fileManager = (NSFileManager *)v5;

    uint64_t v9 = objc_msgSend__tempConfigPath(v4, v7, v8);
    pathToTempDir = v4->_pathToTempDir;
    v4->_pathToTempDir = (NSString *)v9;

    uint64_t v13 = objc_msgSend_configSystemDirectoryPath(APConfigurationMediator, v11, v12);
    pathToConfig = v4->_pathToConfig;
    v4->_pathToConfig = (NSString *)v13;

    uint64_t v16 = objc_msgSend_stringByAppendingPathComponent_(v4->_pathToTempDir, v15, @"APCS-T");
    pathToTraverse = v4->_pathToTraverse;
    v4->_pathToTraverse = (NSString *)v16;

    id v18 = objc_alloc(MEMORY[0x263F20B90]);
    uint64_t v20 = objc_msgSend_initWithOptions_(v18, v19, 1);
    lock = v4->_lock;
    v4->_lock = (APUnfairLock *)v20;

    v4->_cancelled = 0;
  }
  return v4;
}

- (BOOL)processResponseWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend__processData_(self, a2, (uint64_t)a3);
  uint64_t v5 = [APVersionHelper alloc];
  v6 = objc_alloc_init(APVersionData);
  uint64_t v8 = objc_msgSend_initWithDatasource_(v5, v7, (uint64_t)v6);

  uint64_t v11 = objc_msgSend_systemVersion(v8, v9, v10);
  uint64_t v12 = APLogForCategory();
  uint64_t v13 = v12;
  if (v4 == 1200)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v11;
      _os_log_impl(&dword_24718C000, v13, OS_LOG_TYPE_DEFAULT, "Configuration system update completed successfully v%lu.", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v18 = v11;
      __int16 v19 = 2048;
      uint64_t v20 = v4;
      _os_log_impl(&dword_24718C000, v13, OS_LOG_TYPE_ERROR, "Configuration system update failed v%lu, Status: %ld.", buf, 0x16u);
    }

    uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v14, @"Configuration system update failed v%lu, Status: %ld.", v11, v4);
    CreateDiagnosticReport();
  }

  objc_msgSend__sendCoreAnalyticsWithUpdateStatus_version_(self, v15, v4, v11);
  return v4 == 1200;
}

- (void)cancelProcess
{
  objc_msgSend_lock(self, a2, v2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v9, v4, v5);
  objc_msgSend_setCancelled_(self, v6, 1);
  objc_msgSend_unlock(v9, v7, v8);
}

- (BOOL)_isCancelled
{
  uint64_t v3 = self;
  uint64_t v4 = objc_msgSend_lock(self, a2, v2);
  objc_msgSend_lock(v4, v5, v6);
  LOBYTE(v3) = objc_msgSend_cancelled(v3, v7, v8);
  objc_msgSend_unlock(v4, v9, v10);

  return (char)v3;
}

- (int64_t)_processData:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend__createTempDirectory(self, v5, v6))
  {
    int64_t v11 = 1501;
    goto LABEL_10;
  }
  if (!objc_msgSend__isCancelled(self, v7, v8))
  {
    uint64_t v12 = objc_msgSend_pathToTempDir(self, v9, v10);
    v14 = objc_msgSend_stringByAppendingPathComponent_(v12, v13, @"APCS.tar.gz");

    if (objc_msgSend__writeCompressedFileWithData_atPath_(self, v15, (uint64_t)v4, v14))
    {
      if (!objc_msgSend__isCancelled(self, v16, v17))
      {
        if ((objc_msgSend__copyCurrentConfigToTraverse(self, v18, v19) & 1) == 0)
        {
          objc_msgSend__removeTempDirectory(self, v21, v22);
          int64_t v11 = 1503;
          goto LABEL_9;
        }
        if (!objc_msgSend__isCancelled(self, v21, v22))
        {
          objc_super v23 = objc_alloc_init(APConfigurationDecompressor);
          v26 = objc_msgSend_pathToTempDir(self, v24, v25);
          v28 = objc_msgSend_stringByAppendingPathComponent_(v26, v27, @"APCS.tar");

          uint64_t v30 = objc_msgSend_decompressTarAtPath_toPath_(v23, v29, (uint64_t)v14, v28);
          if (v30 == 1200)
          {
            if (objc_msgSend__isCancelled(self, v31, v32))
            {
              objc_msgSend__removeTempDirectory(self, v33, v34);
              int64_t v11 = 1513;
            }
            else
            {
              v35 = objc_msgSend_pathToTempDir(self, v33, v34);
              v37 = objc_msgSend_stringByAppendingPathComponent_(v35, v36, @"APCS");

              v40 = objc_msgSend_pathToTraverse(self, v38, v39);
              int64_t v11 = objc_msgSend__traverseDirectoryAtPath_replacingConfigurationAtPath_(self, v41, (uint64_t)v37, v40);

              if (v11 == 1200)
              {
                if (objc_msgSend__isCancelled(self, v42, v43))
                {
                  objc_msgSend__removeTempDirectory(self, v44, v45);
                  int64_t v11 = 1513;
                }
                else
                {
                  int v46 = objc_msgSend__replaceConfigWithNewHierarchy(self, v44, v45);
                  objc_msgSend__removeTempDirectory(self, v47, v48);
                  if (v46) {
                    int64_t v11 = 1200;
                  }
                  else {
                    int64_t v11 = 1511;
                  }
                }
              }
              else
              {
                objc_msgSend__removeTempDirectory(self, v42, v43);
              }
            }
          }
          else
          {
            int64_t v11 = v30;
            objc_msgSend__removeTempDirectory(self, v31, v32);
          }

          goto LABEL_9;
        }
      }
      objc_msgSend__removeTempDirectory(self, v18, v19);
      int64_t v11 = 1513;
    }
    else
    {
      objc_msgSend__removeTempDirectory(self, v16, v17);
      int64_t v11 = 1502;
    }
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend__removeTempDirectory(self, v9, v10);
  int64_t v11 = 1513;
LABEL_10:

  return v11;
}

- (BOOL)_writeCompressedFileWithData:(id)a3 atPath:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v10 = 0;
  objc_msgSend_writeToFile_options_error_(a3, a2, (uint64_t)a4, 0x10000000, &v10);
  id v4 = v10;
  if (v4)
  {
    uint64_t v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend_description(v4, v6, v7);
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_24718C000, v5, OS_LOG_TYPE_ERROR, "Error: Failed to write to file: %{public}@", buf, 0xCu);
    }
  }

  return v4 == 0;
}

- (BOOL)_createTempDirectory
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_fileManager(self, a2, v2);
  uint64_t v7 = objc_msgSend_pathToTempDir(self, v5, v6);
  if (objc_msgSend_fileExistsAtPath_(v4, v8, (uint64_t)v7)
    && (id v23 = 0, objc_msgSend_removeItemAtPath_error_(v4, v9, (uint64_t)v7, &v23), (v10 = v23) != 0))
  {
    int64_t v11 = v10;
    uint64_t v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend_description(v11, v13, v14);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v15;
      uint64_t v16 = "Error: Failed to remove temp directory: %{public}@";
LABEL_8:
      _os_log_impl(&dword_24718C000, v12, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
    }
  }
  else
  {
    id v22 = 0;
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v4, v9, (uint64_t)v7, 0, 0, &v22);
    id v17 = v22;
    if (!v17)
    {
      BOOL v20 = 1;
      goto LABEL_11;
    }
    int64_t v11 = v17;
    uint64_t v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend_description(v11, v18, v19);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v15;
      uint64_t v16 = "Error: Failed to create temp directory: %{public}@";
      goto LABEL_8;
    }
  }

  BOOL v20 = 0;
LABEL_11:

  return v20;
}

- (BOOL)_copyCurrentConfigToTraverse
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_pathToConfig(self, a2, v2);
  uint64_t v7 = objc_msgSend_fileManager(self, v5, v6);
  if (objc_msgSend_fileExistsAtPath_(v7, v8, (uint64_t)v4)
    && (objc_msgSend_pathToTraverse(self, v9, v10),
        int64_t v11 = objc_claimAutoreleasedReturnValue(),
        id v20 = 0,
        objc_msgSend_copyItemAtPath_toPath_error_(v7, v12, (uint64_t)v4, v11, &v20),
        id v13 = v20,
        v11,
        v13))
  {
    uint64_t v14 = APLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v17 = objc_msgSend_description(v13, v15, v16);
      *(_DWORD *)buf = 138543362;
      id v22 = v17;
      _os_log_impl(&dword_24718C000, v14, OS_LOG_TYPE_ERROR, "Error: Failed to create fallback file: %{public}@", buf, 0xCu);
    }
    BOOL v18 = 0;
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (BOOL)_removeTempDirectory
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_fileManager(self, a2, v2);
  uint64_t v7 = objc_msgSend_pathToTempDir(self, v5, v6);
  id v15 = 0;
  objc_msgSend_removeItemAtPath_error_(v4, v8, (uint64_t)v7, &v15);
  id v9 = v15;

  if (v9)
  {
    uint64_t v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend_description(v9, v11, v12);
      *(_DWORD *)buf = 138543362;
      id v17 = v13;
      _os_log_impl(&dword_24718C000, v10, OS_LOG_TYPE_ERROR, "Error: Failed to remove temp directory: %{public}@", buf, 0xCu);
    }
  }

  return v9 == 0;
}

- (BOOL)_replaceConfigWithNewHierarchy
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_fileManager(self, a2, v2);
  uint64_t v7 = objc_msgSend_pathToConfig(self, v5, v6);
  uint64_t v10 = objc_msgSend_pathToTraverse(self, v8, v9);
  if (objc_msgSend_fileExistsAtPath_(v4, v11, (uint64_t)v7))
  {
    id v13 = objc_msgSend_fileURLWithPath_(NSURL, v12, (uint64_t)v7);
    id v15 = objc_msgSend_fileURLWithPath_(NSURL, v14, (uint64_t)v10);
    id v24 = 0;
    objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_(v4, v16, (uint64_t)v13, v15, 0, 3, 0, &v24);
    id v17 = v24;

    if (!v17) {
      goto LABEL_8;
    }
  }
  else
  {
    id v23 = 0;
    objc_msgSend_moveItemAtPath_toPath_error_(v4, v12, (uint64_t)v10, v7, &v23);
    id v17 = v23;
    if (!v17) {
      goto LABEL_8;
    }
  }
  uint64_t v18 = APLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = objc_msgSend_description(v17, v19, v20);
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v21;
    _os_log_impl(&dword_24718C000, v18, OS_LOG_TYPE_ERROR, "Error: Failed to replace traversed hierarchy: %{public}@", buf, 0xCu);
  }
LABEL_8:

  return v17 == 0;
}

- (id)_tempConfigPath
{
  uint64_t v2 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  uint64_t v5 = objc_msgSend_lastObject(v2, v3, v4);

  uint64_t v8 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v6, v7);
  int64_t v11 = objc_msgSend_bundleIdentifier(v8, v9, v10);

  id v13 = objc_msgSend_stringByAppendingPathComponent_(v5, v12, (uint64_t)v11);
  id v15 = objc_msgSend_stringByAppendingPathComponent_(v13, v14, @"APCS-TEMP");

  return v15;
}

- (int64_t)_traverseDirectoryAtPath:(id)a3 replacingConfigurationAtPath:(id)a4
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8);
  v78 = v5;
  objc_msgSend_enumeratorAtPath_(v9, v10, (uint64_t)v5);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v86, v96, 16);
  id v14 = 0;
  if (v82)
  {
    uint64_t v15 = *(void *)v87;
    v79 = v9;
    id v76 = v11;
    id v77 = v6;
    uint64_t v75 = *(void *)v87;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v87 != v15) {
        objc_enumerationMutation(v11);
      }
      id v17 = *(void **)(*((void *)&v86 + 1) + 8 * v16);
      uint64_t v18 = objc_msgSend_stringByAppendingPathComponent_(v6, v13, (uint64_t)v17);
      uint64_t v21 = objc_msgSend_pathExtension(v17, v19, v20);
      if (objc_msgSend_isEqualToString_(v21, v22, (uint64_t)&stru_26FB57F48))
      {
        if ((objc_msgSend_fileExistsAtPath_(v9, v23, (uint64_t)v18) & 1) == 0)
        {
          id v85 = v14;
          objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v9, v24, (uint64_t)v18, 1, 0, &v85);
          id v25 = v85;

          id v14 = 0;
          if (v25)
          {
            v67 = APLogForCategory();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              v71 = objc_msgSend_description(v25, v69, v70);
              *(_DWORD *)buf = 138543362;
              v91 = v71;
              _os_log_impl(&dword_24718C000, v67, OS_LOG_TYPE_ERROR, "Error: Create directory error: %{public}@.", buf, 0xCu);
            }
            int64_t v74 = 1507;
            id v14 = v25;
            goto LABEL_43;
          }
        }
        goto LABEL_33;
      }
      if (objc_msgSend_isEqualToString_(v21, v23, @"json")) {
        break;
      }
LABEL_33:

LABEL_34:
      if (v82 == ++v16)
      {
        uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v86, v96, 16);
        uint64_t v82 = v66;
        if (v66) {
          goto LABEL_3;
        }
        goto LABEL_39;
      }
    }
    v80 = objc_msgSend_stringByDeletingLastPathComponent(v17, v26, v27);
    v29 = objc_msgSend_stringByAppendingPathComponent_(v6, v28, (uint64_t)v80);
    v31 = objc_msgSend_stringByAppendingPathComponent_(v29, v30, @"ConfigurationNode.json");

    v81 = objc_msgSend_fileURLWithPath_(NSURL, v32, (uint64_t)v31);
    uint64_t v34 = objc_msgSend_stringByAppendingPathComponent_(v78, v33, (uint64_t)v17);
    v37 = objc_msgSend_versionNumberFromJSONFileAtPath_(APVersionHelper, v35, (uint64_t)v34);
    if (v37)
    {
      v38 = objc_msgSend_fileURLWithPath_(NSURL, v36, (uint64_t)v34);
      if (objc_msgSend_fileExistsAtPath_(v9, v39, (uint64_t)v31))
      {
        uint64_t v43 = objc_msgSend_versionNumberFromJSONFileAtPath_(APVersionHelper, v40, (uint64_t)v31);
        if (v43)
        {
          uint64_t v44 = objc_msgSend_integerValue(v37, v41, v42);
          if (v44 <= objc_msgSend_integerValue(v43, v45, v46))
          {
            v59 = APLogForCategory();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              log = v59;
              uint64_t v62 = objc_msgSend_integerValue(v37, v60, v61);
              uint64_t v65 = objc_msgSend_integerValue(v43, v63, v64);
              *(_DWORD *)buf = 138543874;
              v91 = v34;
              __int16 v92 = 2048;
              uint64_t v93 = v62;
              v59 = log;
              __int16 v94 = 2048;
              uint64_t v95 = v65;
              _os_log_impl(&dword_24718C000, log, OS_LOG_TYPE_DEBUG, "Node at path %{public}@ received with version: %ld, current version is %ld, skipping update for this node.", buf, 0x20u);
            }

            int v48 = 0;
            int v49 = 1;
            goto LABEL_31;
          }
        }
        id v84 = v14;
        objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_(v79, v41, (uint64_t)v81, v38, 0, 3, 0, &v84);
        id v47 = v84;

        id v14 = v47;
      }
      else
      {
        id v83 = v14;
        objc_msgSend_moveItemAtPath_toPath_error_(v9, v40, (uint64_t)v34, v31, &v83);
        uint64_t v43 = v14;
        id v14 = v83;
      }

      v51 = APLogForCategory();
      v52 = v51;
      if (!v14)
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          uint64_t v58 = objc_msgSend_integerValue(v37, v56, v57);
          *(_DWORD *)buf = 138543618;
          v91 = v34;
          __int16 v92 = 2048;
          uint64_t v93 = v58;
          _os_log_impl(&dword_24718C000, v52, OS_LOG_TYPE_INFO, "Migration of file at path: %{public}@, version: %ld complete.", buf, 0x16u);
        }

        int v49 = 0;
        id v14 = 0;
        int v48 = 1;
        goto LABEL_31;
      }
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v55 = objc_msgSend_description(v14, v53, v54);
        *(_DWORD *)buf = 138543362;
        v91 = v55;
        _os_log_impl(&dword_24718C000, v52, OS_LOG_TYPE_ERROR, "Error: Replace item error: %{public}@.", buf, 0xCu);
      }
      int v48 = 0;
      int v49 = 0;
      uint64_t v50 = 1509;
    }
    else
    {
      v38 = APLogForCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v91 = v34;
        _os_log_impl(&dword_24718C000, v38, OS_LOG_TYPE_ERROR, "Error: Node could not be parsed, path %{public}@.", buf, 0xCu);
      }
      int v48 = 0;
      int v49 = 0;
      uint64_t v50 = 1508;
    }
    int64_t v74 = v50;
LABEL_31:

    if (!v48)
    {

      id v11 = v76;
      id v6 = v77;
      uint64_t v9 = v79;
      uint64_t v15 = v75;
      if (!v49) {
        goto LABEL_43;
      }
      goto LABEL_34;
    }
    id v11 = v76;
    id v6 = v77;
    uint64_t v9 = v79;
    uint64_t v15 = v75;
    goto LABEL_33;
  }
LABEL_39:
  int64_t v74 = 1200;
LABEL_43:

  return v74;
}

- (void)_sendCoreAnalyticsWithUpdateStatus:(int64_t)a3 version:(int64_t)a4
{
  v19[3] = *MEMORY[0x263EF8340];
  v18[0] = @"ClientConfigVersion";
  id v6 = objc_msgSend_numberWithInteger_(NSNumber, a2, a4);
  v19[0] = v6;
  v18[1] = @"StatusCode";
  uint64_t v8 = objc_msgSend_numberWithInteger_(NSNumber, v7, a3);
  v19[1] = v8;
  v18[2] = @"TestingFlag";
  uint64_t v9 = NSNumber;
  uint64_t v12 = objc_msgSend__testingFlag(self, v10, v11);
  id v14 = objc_msgSend_numberWithBool_(v9, v13, v12);
  v19[2] = v14;
  uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)v19, v18, 3);

  objc_msgSend_sendEvent_customPayload_(MEMORY[0x263F20B48], v17, @"ConfigurationSystemRequest", v16);
}

- (BOOL)_testingFlag
{
  if (!objc_msgSend_isAppleInternalInstall(MEMORY[0x263F20B88], a2, v2)) {
    return 0;
  }
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  id v5 = objc_msgSend_initWithSuiteName_(v3, v4, *MEMORY[0x263F20B40]);
  uint64_t v7 = objc_msgSend_objectForKey_(v5, v6, @"APConfigurationSystem.testEnvironment");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    char v13 = objc_msgSend_BOOLValue(v10, v11, v12);
  }
  else
  {
    id v10 = (id)MEMORY[0x263EFFA80];
    char v13 = objc_msgSend_BOOLValue(MEMORY[0x263EFFA80], v8, v9);
  }
  char v14 = v13;

  return (v14 & 1) != 0;
}

- (int64_t)_configurationVersion
{
  uint64_t v2 = [APVersionHelper alloc];
  id v3 = objc_alloc_init(APVersionData);
  id v5 = objc_msgSend_initWithDatasource_(v2, v4, (uint64_t)v3);

  int64_t v8 = objc_msgSend_systemVersion(v5, v6, v7);
  return v8;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (NSString)pathToTempDir
{
  return self->_pathToTempDir;
}

- (NSString)pathToConfig
{
  return self->_pathToConfig;
}

- (NSString)pathToTraverse
{
  return self->_pathToTraverse;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_pathToTraverse, 0);
  objc_storeStrong((id *)&self->_pathToConfig, 0);
  objc_storeStrong((id *)&self->_pathToTempDir, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end