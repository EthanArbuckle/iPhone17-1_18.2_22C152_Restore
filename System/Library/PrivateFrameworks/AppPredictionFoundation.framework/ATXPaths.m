@interface ATXPaths
+ (id)_getDirectoryBase;
+ (id)_getDirectoryCreating:(BOOL)a3;
+ (id)appPredictionBackupDirectory;
+ (id)appPredictionCacheDirectory;
+ (id)appPredictionDirectory;
+ (id)appPredictionDirectoryFile:(id)a3;
+ (id)biomeStreamsRootDirectory;
+ (id)bookmarksPathFile:(id)a3;
+ (id)clientModelCachesRootDirectory;
+ (id)complicationInlineSetCacheFilePath;
+ (id)complicationLandscapeModularSetCacheFilePath;
+ (id)complicationModularSetCacheFilePath;
+ (id)contextualActionsModelDirectory;
+ (id)contextualActionsModelFileWithFilename:(id)a3;
+ (id)faceGalleryDemoConfigurationFilePath;
+ (id)feedbackRootDirectory;
+ (id)magicalMomentsPredictionTablesRootDirectory;
+ (id)metricsRootDirectory;
+ (id)modeCachesRootDirectory;
+ (id)modificationDateOfFileAtPath:(id)a3;
+ (id)onboardingStackResultCacheFilePath;
+ (id)onboardingStackWidgetCacheFilePath;
+ (id)posterConfigurationCacheFilePath;
+ (id)posterDescriptorCacheFilePath;
+ (id)scoreNormalizationModelDirectory;
+ (id)scoreNormalizationModelFileWithFilename:(id)a3;
+ (id)trialFolderResourcePath;
+ (id)uiCachesRootDirectory;
+ (id)watchFaceConfigurationCacheFilePath;
+ (id)websiteSuggestionsVerticalModelCacheFilePath;
+ (id)websiteTitlesAndSubtitlesCacheFilePath;
+ (id)widgetPredictionModelDirectory;
+ (id)widgetPredictionModelFileWithFilename:(id)a3;
+ (void)_recursivelyCreateDirectoryWithErrorHandlingAtPath:(id)a3;
+ (void)createDataVault:(id)a3;
+ (void)createDirectoriesIfNeeded;
@end

@implementation ATXPaths

+ (id)uiCachesRootDirectory
{
  v2 = +[ATXPaths appPredictionDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"UICaches"];

  return v3;
}

+ (id)appPredictionDirectoryFile:(id)a3
{
  id v3 = a3;
  v4 = +[ATXPaths appPredictionDirectory];
  v5 = [v4 stringByAppendingPathComponent:v3];

  return v5;
}

+ (id)appPredictionDirectory
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__ATXPaths_appPredictionDirectory__block_invoke;
  v4[3] = &__block_descriptor_41_e5_v8__0l;
  v4[4] = a1;
  char v5 = 0;
  if (appPredictionDirectory_onceToken != -1) {
    dispatch_once(&appPredictionDirectory_onceToken, v4);
  }
  v2 = (void *)appPredictionDirectory_dir;
  return v2;
}

+ (void)createDirectoriesIfNeeded
{
  v15[12] = *MEMORY[0x1E4F143B8];
  id v3 = [a1 _getDirectoryCreating:1];
  v15[0] = @"MagicalMoments";
  v15[1] = @"caches";
  v15[2] = @"ClientModelCaches";
  v15[3] = @"UICaches";
  v15[4] = @"feedback";
  v15[5] = @"streams";
  v15[6] = @"metrics";
  v15[7] = @"models";
  v15[8] = @"ModeCaches";
  v15[9] = @"Bookmarks";
  v15[10] = @"WidgetPredictionModelDirectory";
  v15[11] = @"ScoreNormalizationModel";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:12];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(v3, "stringByAppendingPathComponent:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10);
        [a1 _recursivelyCreateDirectoryWithErrorHandlingAtPath:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

+ (void)_recursivelyCreateDirectoryWithErrorHandlingAtPath:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = 0;
  char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v10];
  id v6 = v10;

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = [v6 code];
    uint64_t v8 = __atxlog_handle_default();
    v9 = v8;
    if (v7 == 640)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[ATXPaths _recursivelyCreateDirectoryWithErrorHandlingAtPath:]((uint64_t)v3, v9);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      +[ATXPaths _recursivelyCreateDirectoryWithErrorHandlingAtPath:]();
    }
  }
}

uint64_t __34__ATXPaths_appPredictionDirectory__block_invoke(uint64_t a1)
{
  appPredictionDirectory_dir = [*(id *)(a1 + 32) _getDirectoryCreating:*(unsigned __int8 *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

+ (id)_getDirectoryBase
{
  return (id)[@"/var/mobile/Library/" stringByAppendingPathComponent:@"DuetExpertCenter"];
}

+ (id)_getDirectoryCreating:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [a1 _getDirectoryBase];
  if (v3)
  {
    [a1 _recursivelyCreateDirectoryWithErrorHandlingAtPath:v5];
    +[ATXPaths createDataVault:v5];
  }
  return v5;
}

+ (void)createDataVault:(id)a3
{
  id v3 = a3;
  id v4 = (const char *)[v3 UTF8String];
  int v5 = rootless_check_datavault_flag();
  if (v5 == 1)
  {
    if (chmod(v4, 0x1C0u))
    {
      id v6 = __atxlog_handle_default();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[ATXPaths createDataVault:]((uint64_t)v3, v6);
      }
    }
    else
    {
      int v11 = rootless_convert_to_datavault();
      long long v12 = __atxlog_handle_default();
      id v6 = v12;
      if (!v11)
      {
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_11;
        }
        __int16 v13 = 0;
        uint64_t v7 = "Directory successfully converted to Data Vault";
        uint64_t v8 = (uint8_t *)&v13;
        v9 = v6;
        os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_5;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[ATXPaths createDataVault:]();
      }
    }
  }
  else if (v5)
  {
    id v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[ATXPaths createDataVault:]();
    }
  }
  else
  {
    id v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "Data Vault already created";
      uint64_t v8 = buf;
      v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
LABEL_5:
      _os_log_impl(&dword_1D0F2B000, v9, v10, v7, v8, 2u);
    }
  }
LABEL_11:
}

+ (id)appPredictionCacheDirectory
{
  v2 = +[ATXPaths appPredictionDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"caches"];

  return v3;
}

+ (id)appPredictionBackupDirectory
{
  v2 = +[ATXPaths appPredictionDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"Backups"];

  return v3;
}

+ (id)magicalMomentsPredictionTablesRootDirectory
{
  v2 = +[ATXPaths appPredictionDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"MagicalMoments"];

  return v3;
}

+ (id)clientModelCachesRootDirectory
{
  v2 = +[ATXPaths appPredictionDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"ClientModelCaches"];

  return v3;
}

+ (id)feedbackRootDirectory
{
  v2 = +[ATXPaths appPredictionDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"feedback"];

  return v3;
}

+ (id)biomeStreamsRootDirectory
{
  v2 = +[ATXPaths appPredictionDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"streams"];

  return v3;
}

+ (id)metricsRootDirectory
{
  v2 = +[ATXPaths appPredictionDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"metrics"];

  return v3;
}

+ (id)trialFolderResourcePath
{
  v2 = +[ATXPaths appPredictionDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"models"];

  return v3;
}

+ (id)modeCachesRootDirectory
{
  v2 = +[ATXPaths appPredictionDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"ModeCaches"];

  return v3;
}

+ (id)bookmarksPathFile:(id)a3
{
  id v3 = a3;
  id v4 = +[ATXPaths appPredictionDirectory];
  int v5 = [v4 stringByAppendingPathComponent:@"Bookmarks"];
  id v6 = [v5 stringByAppendingPathComponent:v3];

  return v6;
}

+ (id)contextualActionsModelDirectory
{
  v2 = +[ATXPaths appPredictionDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"ContextualActionsModel"];

  return v3;
}

+ (id)contextualActionsModelFileWithFilename:(id)a3
{
  id v4 = a3;
  int v5 = [a1 contextualActionsModelDirectory];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

+ (id)scoreNormalizationModelDirectory
{
  v2 = +[ATXPaths appPredictionDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"ScoreNormalizationModel"];

  return v3;
}

+ (id)scoreNormalizationModelFileWithFilename:(id)a3
{
  id v4 = a3;
  int v5 = [a1 scoreNormalizationModelDirectory];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

+ (id)widgetPredictionModelDirectory
{
  v2 = +[ATXPaths appPredictionDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"WidgetPredictionModelDirectory"];

  return v3;
}

+ (id)widgetPredictionModelFileWithFilename:(id)a3
{
  id v4 = a3;
  int v5 = [a1 widgetPredictionModelDirectory];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

+ (id)onboardingStackWidgetCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:@"ATXOnboardingStackWidgetCache"];
}

+ (id)onboardingStackResultCacheFilePath
{
  v2 = +[ATXPaths appPredictionBackupDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"ATXOnboardingStackResultCache"];

  return v3;
}

+ (id)posterDescriptorCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:@"PosterDescriptorCache"];
}

+ (id)posterConfigurationCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:@"PosterConfigurationCache"];
}

+ (id)faceGalleryDemoConfigurationFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:@"FaceGalleryDemoConfiguration.json"];
}

+ (id)complicationModularSetCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:@"ComplicationsModularSetCache"];
}

+ (id)complicationLandscapeModularSetCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:@"LandscapeComplicationsModularSetCache"];
}

+ (id)complicationInlineSetCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:@"ComplicationsInlineSetCache"];
}

+ (id)websiteSuggestionsVerticalModelCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:@"WebsiteSuggestionsVerticalModelCache"];
}

+ (id)websiteTitlesAndSubtitlesCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:@"WebsiteTitlesAndSubtitlesCache"];
}

+ (id)watchFaceConfigurationCacheFilePath
{
  return +[ATXPaths appPredictionDirectoryFile:@"WatchFaceConfigurationCache"];
}

+ (id)modificationDateOfFileAtPath:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = 0;
  int v5 = [v4 attributesOfItemAtPath:v3 error:&v10];
  id v6 = v10;

  if (v6)
  {
    uint64_t v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ATXPaths modificationDateOfFileAtPath:]();
    }

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28310]];
  }

  return v8;
}

+ (void)_recursivelyCreateDirectoryWithErrorHandlingAtPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F2B000, a2, OS_LOG_TYPE_ERROR, "Could not create directory (out of space): %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_recursivelyCreateDirectoryWithErrorHandlingAtPath:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1D0F2B000, v0, OS_LOG_TYPE_FAULT, "Could not create directory: %@ path: %@", v1, 0x16u);
}

+ (void)createDataVault:.cold.1()
{
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_2(&dword_1D0F2B000, v1, v2, "Failed to check status of directory %@: [%i] %s", v3, v4, v5, v6, v7);
}

+ (void)createDataVault:.cold.2()
{
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_2(&dword_1D0F2B000, v1, v2, "Failed to convert to a Data Vault: %@: [%i] %s", v3, v4, v5, v6, v7);
}

+ (void)createDataVault:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  uint64_t v5 = __error();
  uint64_t v6 = strerror(*v5);
  v7[0] = 67109890;
  v7[1] = 448;
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  __int16 v10 = 1024;
  int v11 = v4;
  __int16 v12 = 2080;
  __int16 v13 = v6;
  _os_log_error_impl(&dword_1D0F2B000, a2, OS_LOG_TYPE_ERROR, "Failed to set mode 0%o on directory %@: [%i] %s", (uint8_t *)v7, 0x22u);
}

+ (void)modificationDateOfFileAtPath:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1D0F2B000, v0, OS_LOG_TYPE_ERROR, "Encountered error getting file age for path: %@. Error: %@", v1, 0x16u);
}

@end