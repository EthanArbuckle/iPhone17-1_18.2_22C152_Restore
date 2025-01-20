@interface DMCObliterationShelter
- (BOOL)_createDirectoryAtPathIfNeeded:(id)a3 error:(id *)a4;
- (BOOL)clear;
- (BOOL)hasConfigFile;
- (BOOL)isSupervised;
- (BOOL)preserveWithError:(id *)a3;
- (BOOL)retrieveWithError:(id *)a3;
- (NSArray)languageStrings;
- (NSData)mdmProfileData;
- (NSData)wifiProfileData;
- (NSDictionary)cloudConfigurationDetails;
- (NSString)localeString;
- (id)_allPathsToClear;
- (id)_cloudConfigProfilePath_retrieve;
- (id)_cloudConfigProfilePath_stash;
- (id)_configurationDictionaryPath_retrieve;
- (id)_configurationDictionaryPath_stash;
- (id)_generateConfigurationDictionary;
- (id)_mdmProfilePath_retrieve;
- (id)_mdmProfilePath_stash;
- (id)_stashDirectoryPath;
- (id)_wifiProfilePath_retrieve;
- (id)_wifiProfilePath_stash;
- (id)generateExclusionPaths;
- (void)migrateAllFiles;
- (void)setCloudConfigurationDetails:(id)a3;
- (void)setHasConfigFile:(BOOL)a3;
- (void)setIsSupervised:(BOOL)a3;
- (void)setLanguageStrings:(id)a3;
- (void)setLocaleString:(id)a3;
- (void)setMdmProfileData:(id)a3;
- (void)setWifiProfileData:(id)a3;
@end

@implementation DMCObliterationShelter

- (BOOL)preserveWithError:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v5 = [(DMCObliterationShelter *)self _stashDirectoryPath];
  BOOL v6 = [(DMCObliterationShelter *)self _createDirectoryAtPathIfNeeded:v5 error:a3];

  if (v6)
  {
    v7 = [(DMCObliterationShelter *)self _generateConfigurationDictionary];
    v8 = [(DMCObliterationShelter *)self _configurationDictionaryPath_stash];
    char v9 = [v7 DMCWriteToBinaryFile:v8];

    if (v9)
    {
      v10 = [(DMCObliterationShelter *)self _configurationDictionaryPath_stash];
      DMCSetSkipBackupAttributeToItemAtPath(v10, 1);

      v11 = [(DMCObliterationShelter *)self wifiProfileData];

      if (v11)
      {
        v12 = [(DMCObliterationShelter *)self wifiProfileData];
        v13 = [(DMCObliterationShelter *)self _wifiProfilePath_stash];
        id v35 = 0;
        [v12 writeToFile:v13 options:0 error:&v35];
        id v14 = v35;

        if (v14)
        {
          v15 = *DMCLogObjects();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v37 = v14;
            v16 = "DMCObliterationShelter: Failed to store wifi profile data with error: %{public}@";
LABEL_17:
            _os_log_impl(&dword_1A7863000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
            goto LABEL_18;
          }
          goto LABEL_18;
        }
        v22 = [(DMCObliterationShelter *)self _wifiProfilePath_stash];
        DMCSetSkipBackupAttributeToItemAtPath(v22, 1);
      }
      v23 = [(DMCObliterationShelter *)self mdmProfileData];

      if (v23)
      {
        v24 = [(DMCObliterationShelter *)self mdmProfileData];
        v25 = [(DMCObliterationShelter *)self _mdmProfilePath_stash];
        id v34 = 0;
        [v24 writeToFile:v25 options:0 error:&v34];
        id v14 = v34;

        if (v14)
        {
          v15 = *DMCLogObjects();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v37 = v14;
            v16 = "DMCObliterationShelter: Failed to store mdm profile data with error: %{public}@";
            goto LABEL_17;
          }
LABEL_18:
          if (a3)
          {
            id v14 = v14;
            *a3 = v14;
          }
          BOOL v17 = 1;
          goto LABEL_21;
        }
        v27 = [(DMCObliterationShelter *)self _mdmProfilePath_stash];
        DMCSetSkipBackupAttributeToItemAtPath(v27, 1);
      }
      v28 = [(DMCObliterationShelter *)self cloudConfigurationDetails];

      if (!v28)
      {
        BOOL v17 = 1;
        goto LABEL_24;
      }
      v29 = [(DMCObliterationShelter *)self cloudConfigurationDetails];
      v30 = [(DMCObliterationShelter *)self _cloudConfigProfilePath_stash];
      char v31 = [v29 DMCWriteToBinaryFile:v30];

      if (v31)
      {
        v32 = [(DMCObliterationShelter *)self _cloudConfigProfilePath_stash];
        BOOL v17 = 1;
        DMCSetSkipBackupAttributeToItemAtPath(v32, 1);

LABEL_24:
        return v17;
      }
      v33 = *DMCLogObjects();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v37 = 0;
        v19 = "DMCObliterationShelter: Failed to store cloud config profile with error: %{public}@";
        v20 = v33;
        uint32_t v21 = 12;
        goto LABEL_10;
      }
    }
    else
    {
      v18 = *DMCLogObjects();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v19 = "DMCObliterationShelter: Failed to store configuration file";
        v20 = v18;
        uint32_t v21 = 2;
LABEL_10:
        _os_log_impl(&dword_1A7863000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
      }
    }
    id v14 = 0;
    BOOL v17 = 0;
LABEL_21:

    if (v14) {
      BOOL v17 = 0;
    }
    [(DMCObliterationShelter *)self clear];
    v7 = v14;
    goto LABEL_24;
  }
  [(DMCObliterationShelter *)self clear];
  return 0;
}

- (BOOL)retrieveWithError:(id *)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", a3);
  v5 = [(DMCObliterationShelter *)self _configurationDictionaryPath_retrieve];
  int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    [(DMCObliterationShelter *)self setHasConfigFile:1];
    v7 = (void *)MEMORY[0x1E4F1C9E8];
    v8 = [(DMCObliterationShelter *)self _configurationDictionaryPath_retrieve];
    char v9 = [v7 DMCDictionaryFromFile:v8];

    v10 = [v9 objectForKeyedSubscript:@"Languages"];
    [(DMCObliterationShelter *)self setLanguageStrings:v10];

    v11 = [v9 objectForKeyedSubscript:@"Locale"];
    [(DMCObliterationShelter *)self setLocaleString:v11];

    v12 = [v9 objectForKeyedSubscript:@"IsSupervised"];
    -[DMCObliterationShelter setIsSupervised:](self, "setIsSupervised:", [v12 BOOLValue]);
  }
  v13 = [(DMCObliterationShelter *)self _wifiProfilePath_retrieve];
  int v14 = [v4 fileExistsAtPath:v13];

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4F1C9B8];
    v16 = [(DMCObliterationShelter *)self _wifiProfilePath_retrieve];
    BOOL v17 = [v15 dataWithContentsOfFile:v16];
    [(DMCObliterationShelter *)self setWifiProfileData:v17];
  }
  v18 = [(DMCObliterationShelter *)self _mdmProfilePath_retrieve];
  int v19 = [v4 fileExistsAtPath:v18];

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E4F1C9B8];
    uint32_t v21 = [(DMCObliterationShelter *)self _mdmProfilePath_retrieve];
    v22 = [v20 dataWithContentsOfFile:v21];
    [(DMCObliterationShelter *)self setMdmProfileData:v22];
  }
  v23 = [(DMCObliterationShelter *)self _cloudConfigProfilePath_retrieve];
  int v24 = [v4 fileExistsAtPath:v23];

  if (v24)
  {
    v25 = (void *)MEMORY[0x1E4F1C9E8];
    v26 = [(DMCObliterationShelter *)self _cloudConfigProfilePath_retrieve];
    v27 = [v25 DMCDictionaryFromFile:v26];
    [(DMCObliterationShelter *)self setCloudConfigurationDetails:v27];
  }
  return 1;
}

- (BOOL)clear
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(DMCObliterationShelter *)self setLanguageStrings:0];
  [(DMCObliterationShelter *)self setLocaleString:0];
  [(DMCObliterationShelter *)self setWifiProfileData:0];
  [(DMCObliterationShelter *)self setMdmProfileData:0];
  [(DMCObliterationShelter *)self setCloudConfigurationDetails:0];
  [(DMCObliterationShelter *)self setIsSupervised:0];
  [(DMCObliterationShelter *)self setHasConfigFile:0];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [(DMCObliterationShelter *)self _allPathsToClear];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v19;
    char v9 = 1;
    *(void *)&long long v6 = 138543618;
    long long v16 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v3, "fileExistsAtPath:", v11, v16))
        {
          id v17 = 0;
          [v3 removeItemAtPath:v11 error:&v17];
          id v12 = v17;
          if (v12)
          {
            v13 = v12;
            int v14 = *DMCLogObjects();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v16;
              uint64_t v23 = v11;
              __int16 v24 = 2114;
              v25 = v13;
              _os_log_impl(&dword_1A7863000, v14, OS_LOG_TYPE_ERROR, "DMCObliterationShelter: Failed to remove file from path: %{public}@, error: %{public}@", buf, 0x16u);
            }

            char v9 = 0;
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }
  else
  {
    char v9 = 1;
  }

  return v9 & 1;
}

- (void)migrateAllFiles
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(DMCObliterationShelter *)self _stashDirectoryPath];
  char v5 = [v3 fileExistsAtPath:v4];

  long long v6 = *DMCLogObjects();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v6, OS_LOG_TYPE_DEFAULT, "DMCObliterationShelter: Migrating sheltered files.", buf, 2u);
    }
    uint64_t v8 = [(DMCObliterationShelter *)self _stashDirectoryPath];
    char v9 = [(DMCObliterationShelter *)self _retrievalDirectoryPath];
    id v12 = 0;
    [v3 moveItemAtPath:v8 toPath:v9 error:&v12];
    id v10 = v12;

    if (v10)
    {
      uint64_t v11 = *DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v10;
        _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_ERROR, "DMCObliterationShelter: Failed to migrate stashed directory. Error: %{public}@", buf, 0xCu);
      }
      [(DMCObliterationShelter *)self clear];
    }
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7863000, v6, OS_LOG_TYPE_DEFAULT, "DMCObliterationShelter: Nothing to migrate.", buf, 2u);
  }
}

- (id)_generateConfigurationDictionary
{
  v3 = objc_opt_new();
  v4 = [(DMCObliterationShelter *)self languageStrings];
  [v3 setObject:v4 forKeyedSubscript:@"Languages"];

  char v5 = [(DMCObliterationShelter *)self localeString];
  [v3 setObject:v5 forKeyedSubscript:@"Locale"];

  long long v6 = objc_msgSend(NSNumber, "numberWithBool:", -[DMCObliterationShelter isSupervised](self, "isSupervised"));
  [v3 setObject:v6 forKeyedSubscript:@"IsSupervised"];

  BOOL v7 = (void *)[v3 copy];
  return v7;
}

- (BOOL)_createDirectoryAtPathIfNeeded:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v6 fileExistsAtPath:v5])
  {
    id v7 = 0;
    BOOL v8 = 1;
  }
  else
  {
    id v11 = 0;
    BOOL v8 = 1;
    [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v11];
    id v7 = v11;
    if (v7)
    {
      char v9 = *DMCLogObjects();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v7;
        _os_log_impl(&dword_1A7863000, v9, OS_LOG_TYPE_ERROR, "DMCObliterationShelter: Failed to create stash directory with error: %{public}@", buf, 0xCu);
      }
      if (a4)
      {
        id v7 = v7;
        BOOL v8 = 0;
        *a4 = v7;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
  }

  return v8;
}

- (id)generateExclusionPaths
{
  v3 = objc_opt_new();
  v4 = [(DMCObliterationShelter *)self _configurationDictionaryPath_stash];
  [v3 addObject:v4];

  if (+[DMCMultiUserModeUtilities isSharediPad])
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v6 = [(DMCObliterationShelter *)self _containerMetadataPlistPath_stash];
    int v7 = [v5 fileExistsAtPath:v6];

    if (v7)
    {
      BOOL v8 = [(DMCObliterationShelter *)self _containerMetadataPlistPath_stash];
      [v3 addObject:v8];
    }
  }
  char v9 = [(DMCObliterationShelter *)self wifiProfileData];

  if (v9)
  {
    id v10 = [(DMCObliterationShelter *)self _wifiProfilePath_stash];
    [v3 addObject:v10];
  }
  id v11 = [(DMCObliterationShelter *)self mdmProfileData];

  if (v11)
  {
    id v12 = [(DMCObliterationShelter *)self _mdmProfilePath_stash];
    [v3 addObject:v12];
  }
  id v13 = [(DMCObliterationShelter *)self cloudConfigurationDetails];

  if (v13)
  {
    uint64_t v14 = [(DMCObliterationShelter *)self _cloudConfigProfilePath_stash];
    [v3 addObject:v14];
  }
  uint64_t v15 = (void *)[v3 copy];

  return v15;
}

- (id)_allPathsToClear
{
  uint64_t v5 = 0;
  long long v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__4;
  char v9 = __Block_byref_object_dispose__4;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__DMCObliterationShelter__allPathsToClear__block_invoke;
  v4[3] = &unk_1E5CFDC60;
  v4[4] = self;
  v4[5] = &v5;
  if (_allPathsToClear_onceToken != -1) {
    dispatch_once(&_allPathsToClear_onceToken, v4);
  }
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__DMCObliterationShelter__allPathsToClear__block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _stashDirectoryPath];
  v7[0] = v2;
  v3 = [*(id *)(a1 + 32) _retrievalDirectoryPath];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_stashDirectoryPath
{
  if (+[DMCMultiUserModeUtilities isSharediPad]) {
    MDMSystemReturnToServiceStorageDirectory();
  }
  else {
  id v2 = MDMUserReturnToServiceStorageDirectory();
  }
  return v2;
}

- (id)_configurationDictionaryPath_stash
{
  id v2 = [(DMCObliterationShelter *)self _stashDirectoryPath];
  v3 = [v2 stringByAppendingPathComponent:@"config_stash.plist"];

  return v3;
}

- (id)_wifiProfilePath_stash
{
  id v2 = [(DMCObliterationShelter *)self _stashDirectoryPath];
  v3 = [v2 stringByAppendingPathComponent:@"wifi_profile_stash.mobileconfig"];

  return v3;
}

- (id)_mdmProfilePath_stash
{
  id v2 = [(DMCObliterationShelter *)self _stashDirectoryPath];
  v3 = [v2 stringByAppendingPathComponent:@"mdm_profile_stash.mobileconfig"];

  return v3;
}

- (id)_cloudConfigProfilePath_stash
{
  id v2 = [(DMCObliterationShelter *)self _stashDirectoryPath];
  v3 = [v2 stringByAppendingPathComponent:@"cloud_config_profile_stash.plist"];

  return v3;
}

- (id)_configurationDictionaryPath_retrieve
{
  id v2 = [(DMCObliterationShelter *)self _retrievalDirectoryPath];
  v3 = [v2 stringByAppendingPathComponent:@"config_stash.plist"];

  return v3;
}

- (id)_wifiProfilePath_retrieve
{
  id v2 = [(DMCObliterationShelter *)self _retrievalDirectoryPath];
  v3 = [v2 stringByAppendingPathComponent:@"wifi_profile_stash.mobileconfig"];

  return v3;
}

- (id)_mdmProfilePath_retrieve
{
  id v2 = [(DMCObliterationShelter *)self _retrievalDirectoryPath];
  v3 = [v2 stringByAppendingPathComponent:@"mdm_profile_stash.mobileconfig"];

  return v3;
}

- (id)_cloudConfigProfilePath_retrieve
{
  id v2 = [(DMCObliterationShelter *)self _retrievalDirectoryPath];
  v3 = [v2 stringByAppendingPathComponent:@"cloud_config_profile_stash.plist"];

  return v3;
}

- (BOOL)hasConfigFile
{
  return self->_hasConfigFile;
}

- (void)setHasConfigFile:(BOOL)a3
{
  self->_hasConfigFile = a3;
}

- (NSArray)languageStrings
{
  return self->_languageStrings;
}

- (void)setLanguageStrings:(id)a3
{
}

- (NSString)localeString
{
  return self->_localeString;
}

- (void)setLocaleString:(id)a3
{
}

- (NSData)wifiProfileData
{
  return self->_wifiProfileData;
}

- (void)setWifiProfileData:(id)a3
{
}

- (NSData)mdmProfileData
{
  return self->_mdmProfileData;
}

- (void)setMdmProfileData:(id)a3
{
}

- (NSDictionary)cloudConfigurationDetails
{
  return self->_cloudConfigurationDetails;
}

- (void)setCloudConfigurationDetails:(id)a3
{
}

- (BOOL)isSupervised
{
  return self->_isSupervised;
}

- (void)setIsSupervised:(BOOL)a3
{
  self->_isSupervised = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudConfigurationDetails, 0);
  objc_storeStrong((id *)&self->_mdmProfileData, 0);
  objc_storeStrong((id *)&self->_wifiProfileData, 0);
  objc_storeStrong((id *)&self->_localeString, 0);
  objc_storeStrong((id *)&self->_languageStrings, 0);
}

@end