@interface GEOFilePaths
+ (BOOL)createDirectoryCopyingAttributesFromParent:(id)a3 error:(id *)a4;
+ (NSString)_internal_geoServicesCacheDirectoryPath;
+ (NSString)_internal_homeDirectory;
+ (NSString)analyticsPipelineFilePath;
+ (NSString)analyticsUploadDirectoryPath;
+ (NSString)geodCacheDirectoryPath;
+ (NSString)locationShifterDBFilePath;
+ (NSString)mapsSuggestionsCacheDirectoryPath;
+ (NSString)preferencesDirectoryPath;
+ (NSString)requestCountsDBFilePath;
+ (NSURL)imageServiceDBFileURL;
+ (id)dictionaryRepresentation;
+ (id)pathFor:(unint64_t)a3;
+ (id)urlFor:(unint64_t)a3;
- (GEOFilePaths)init;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
@end

@implementation GEOFilePaths

+ (id)pathFor:(unint64_t)a3
{
  self;
  if (qword_1EB29FD10 != -1) {
    dispatch_once(&qword_1EB29FD10, &__block_literal_global_105);
  }
  if ((~(_WORD)a3 & 0xC000) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      __int16 v38 = 0;
      v33 = MEMORY[0x1E4F14500];
      v34 = "Assertion failed: !(unVaulted && forceVaulted)";
      v35 = (uint8_t *)&v38;
      goto LABEL_52;
    }
LABEL_50:
    v29 = 0;
    goto LABEL_38;
  }
  unint64_t v4 = a3 & 0xFFFFFFFFFFFF3FFFLL;
  if ((a3 & 0xFFFFFFFFFFFF3FFFLL) >= 0x28)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      __int16 v37 = 0;
      v33 = MEMORY[0x1E4F14500];
      v34 = "Assertion failed: filePathType < GEOFilePath_Count";
      v35 = (uint8_t *)&v37;
      goto LABEL_52;
    }
    goto LABEL_50;
  }
  if (pathFor__filePathRecords[4 * v4] != v4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_50;
    }
    __int16 v36 = 0;
    v33 = MEMORY[0x1E4F14500];
    v34 = "Assertion failed: record->filePathType == filePathType";
    v35 = (uint8_t *)&v36;
LABEL_52:
    _os_log_fault_impl(&dword_188D96000, v33, OS_LOG_TYPE_FAULT, v34, v35, 2u);
    goto LABEL_50;
  }
  uint64_t v5 = (unsigned __int16)a3 & 0x8000;
  unint64_t v6 = (a3 >> 14) & 1;
  v7 = (char *)&pathFor__filePathRecords[4 * v4];
  uint64_t v8 = *((void *)v7 + 1);
  v9 = (void *)*((void *)v7 + 3);
  if ((0xEEECD7BBDFuLL >> v4) & 1 | v5) {
    int v10 = v6;
  }
  else {
    int v10 = 1;
  }
  self;
  self;
  v11 = +[GEOPlatform sharedPlatform];
  char v12 = [v11 supportsMultiUser];

  if (v12) {
    goto LABEL_13;
  }
  if (qword_1EB29FD18 != -1) {
    dispatch_once(&qword_1EB29FD18, &__block_literal_global_4_2);
  }
  if (_MergedGlobals_252)
  {
LABEL_13:
    switch(v8)
    {
      case 1:
        uint64_t v13 = +[GEOFilePathsPrivate userContainerLibPathUsingLibSystem];
        goto LABEL_24;
      case 2:
        v17 = +[GEOFilePathsPrivate systemContainerCachesPathUsingLibSystem];
        goto LABEL_21;
      case 3:
        v17 = +[GEOFilePathsPrivate userContainerCachesPathUsingLibSystem];
        v14 = v17;
        v18 = @"GeoServices";
        goto LABEL_26;
      case 4:
        v17 = +[GEOFilePathsPrivate daemonContainerCachesPathUsingLibSystem];
LABEL_21:
        v14 = v17;
        v18 = @"com.apple.geod";
        goto LABEL_26;
      case 5:
        v19 = +[GEOFilePathsPrivate userContainerCachesPathUsingLibSystem];
        v20 = v19;
        v21 = @"com.apple.geod";
        goto LABEL_30;
      case 6:
        uint64_t v13 = +[GEOFilePathsPrivate userContainerCachesPathUsingLibSystem];
        goto LABEL_24;
      case 7:
        v17 = +[GEOFilePathsPrivate daemonContainerCachesPathUsingLibSystem];
        v14 = v17;
        v18 = @"com.apple.geoanalyticsd";
LABEL_26:
        uint64_t v15 = [v17 stringByAppendingPathComponent:v18];
        goto LABEL_27;
      case 8:
        v19 = +[GEOFilePathsPrivate userContainerCachesPathUsingLibSystem];
        v20 = v19;
        v21 = @"com.apple.geoanalyticsd";
LABEL_30:
        v16 = [v19 stringByAppendingPathComponent:v21];

        if (!v10) {
          goto LABEL_37;
        }
        goto LABEL_36;
      case 9:
        v16 = @"/AppleInternal/Maps";
        goto LABEL_37;
      default:
        goto LABEL_17;
    }
  }
  switch(v8)
  {
    case 1:
      v14 = +[GEOFilePaths _internal_homeDirectory];
      v31 = [v14 stringByAppendingPathComponent:@"Library"];
      -[NSString _geo_stringByAppendingOptionalPathComponent:](v31, 0);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    case 2:
    case 3:
      v14 = +[GEOFilePaths _internal_geoServicesCacheDirectoryPath];
      uint64_t v15 = -[NSString _geo_stringByAppendingOptionalPathComponent:](v14, 0);
LABEL_27:
      v16 = (__CFString *)v15;
      goto LABEL_28;
    case 4:
    case 5:
      v22 = +[GEOFilePaths _internal_homeDirectory];
      v23 = [v22 stringByAppendingPathComponent:@"Library"];
      v24 = [v23 stringByAppendingPathComponent:@"Caches"];
      v25 = -[NSString _geo_stringByAppendingOptionalPathComponent:](v24, 0);
      v26 = v25;
      v27 = @"com.apple.geod";
      goto LABEL_35;
    case 6:
      v14 = +[GEOFilePaths _internal_homeDirectory];
      v31 = [v14 stringByAppendingPathComponent:@"Library"];
      v32 = [v31 stringByAppendingPathComponent:@"Caches"];
      -[NSString _geo_stringByAppendingOptionalPathComponent:](v32, 0);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_43:
LABEL_28:

      break;
    case 7:
    case 8:
      v22 = +[GEOFilePaths _internal_homeDirectory];
      v23 = [v22 stringByAppendingPathComponent:@"Library"];
      v24 = [v23 stringByAppendingPathComponent:@"Caches"];
      v25 = -[NSString _geo_stringByAppendingOptionalPathComponent:](v24, 0);
      v26 = v25;
      v27 = @"com.apple.geoanalyticsd";
LABEL_35:
      v16 = [v25 stringByAppendingPathComponent:v27];

      self;
      if (v10)
      {
LABEL_36:
        uint64_t v28 = [(__CFString *)v16 stringByAppendingPathComponent:@"Vault"];

        v16 = (__CFString *)v28;
      }
      break;
    case 9:
      uint64_t v13 = [@"/" stringByAppendingPathComponent:@"AppleInternal/Maps"];
LABEL_24:
      v16 = (__CFString *)v13;
      break;
    default:
LABEL_17:
      v16 = 0;
      break;
  }
LABEL_37:
  v29 = -[NSString _geo_stringByAppendingOptionalPathComponent:](v16, v9);

LABEL_38:

  return v29;
}

+ (NSString)_internal_geoServicesCacheDirectoryPath
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__GEOFilePaths__internal_geoServicesCacheDirectoryPath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB29FD28 != -1) {
    dispatch_once(&qword_1EB29FD28, block);
  }
  v2 = (void *)qword_1EB29FD20;

  return (NSString *)v2;
}

+ (NSString)_internal_homeDirectory
{
  return (NSString *)@"/var/mobile";
}

+ (id)urlFor:(unint64_t)a3
{
  v3 = [a1 pathFor:a3];
  if ([v3 length])
  {
    unint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

uint64_t __27__GEOFilePaths__isMultUser__block_invoke()
{
  uint32_t multiuser_mode = 0;
  uint64_t result = host_check_multiuser_mode(0, &multiuser_mode);
  if (result) {
    BOOL v1 = 0;
  }
  else {
    BOOL v1 = multiuser_mode == 1;
  }
  char v2 = v1;
  _MergedGlobals_252 = v2;
  return result;
}

void __47__GEOFilePaths_registerStateCaptureIfNecessary__block_invoke()
{
  v0 = objc_alloc_init(GEOFilePaths);
  BOOL v1 = (void *)registerStateCaptureIfNecessary_instance;
  registerStateCaptureIfNecessary_instance = (uint64_t)v0;
}

- (GEOFilePaths)init
{
  v8.receiver = self;
  v8.super_class = (Class)GEOFilePaths;
  char v2 = [(GEOFilePaths *)&v8 init];
  if (v2)
  {
    global_queue = (void *)geo_get_global_queue();
    uint64_t v4 = GEORegisterPListStateCaptureAtFrequency();
    stateCaptureHandle = v2->_stateCaptureHandle;
    v2->_stateCaptureHandle = (geo_state_capture_handle *)v4;

    unint64_t v6 = v2;
  }

  return v2;
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  return +[GEOFilePaths dictionaryRepresentation];
}

void __55__GEOFilePaths__internal_geoServicesCacheDirectoryPath__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v1 = objc_msgSend(*(id *)(a1 + 32), "_internal_homeDirectory");
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"Library/Caches/GeoServices"];
  v3 = (void *)qword_1EB29FD20;
  qword_1EB29FD20 = v2;

  uint64_t v4 = GEOGetGEOFilePathsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    uint64_t v6 = qword_1EB29FD20;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "geoServicesCacheDirectory: %@", (uint8_t *)&v5, 0xCu);
  }
}

+ (id)dictionaryRepresentation
{
  v39[2] = *MEMORY[0x1E4F143B8];
  v38[0] = @"homeDirectory";
  v3 = objc_msgSend(a1, "_internal_homeDirectory");
  v38[1] = @"geoServicesCacheDirectoryPath";
  v39[0] = v3;
  uint64_t v4 = objc_msgSend(a1, "_internal_geoServicesCacheDirectoryPath");
  v39[1] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  uint64_t v6 = (void *)[v5 mutableCopy];

  v36[0] = @"systemContainerPathUsingLibSystem";
  uint64_t v7 = +[GEOFilePathsPrivate systemContainerPathUsingLibSystem];
  objc_super v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"<nil>";
  }
  v37[0] = v9;
  v36[1] = @"systemContainerLibraryPathUsingLibSystem";
  uint64_t v10 = +[GEOFilePathsPrivate systemContainerLibraryPathUsingLibSystem];
  v11 = (void *)v10;
  if (v10) {
    char v12 = (__CFString *)v10;
  }
  else {
    char v12 = @"<nil>";
  }
  v37[1] = v12;
  v36[2] = @"systemContainerCachesPathUsingLibSystem";
  uint64_t v13 = +[GEOFilePathsPrivate systemContainerCachesPathUsingLibSystem];
  v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (__CFString *)v13;
  }
  else {
    uint64_t v15 = @"<nil>";
  }
  v37[2] = v15;
  v36[3] = @"daemonContainerPathUsingLibSystem";
  uint64_t v16 = +[GEOFilePathsPrivate daemonContainerPathUsingLibSystem];
  v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = @"<nil>";
  }
  v37[3] = v18;
  v36[4] = @"daemonContainerLibraryPathUsingLibSystem";
  uint64_t v19 = +[GEOFilePathsPrivate daemonContainerLibraryPathUsingLibSystem];
  v20 = (void *)v19;
  if (v19) {
    v21 = (__CFString *)v19;
  }
  else {
    v21 = @"<nil>";
  }
  v37[4] = v21;
  v36[5] = @"daemonContainerCachesPathUsingLibSystem";
  uint64_t v22 = +[GEOFilePathsPrivate daemonContainerCachesPathUsingLibSystem];
  v23 = (void *)v22;
  if (v22) {
    v24 = (__CFString *)v22;
  }
  else {
    v24 = @"<nil>";
  }
  v37[5] = v24;
  v36[6] = @"userContainerLibPathUsingLibSystem";
  uint64_t v25 = +[GEOFilePathsPrivate userContainerLibPathUsingLibSystem];
  v26 = (void *)v25;
  if (v25) {
    v27 = (__CFString *)v25;
  }
  else {
    v27 = @"<nil>";
  }
  v37[6] = v27;
  v36[7] = @"userContainerCachesPathUsingLibSystem";
  uint64_t v28 = +[GEOFilePathsPrivate userContainerCachesPathUsingLibSystem];
  v29 = (void *)v28;
  if (v28) {
    v30 = (__CFString *)v28;
  }
  else {
    v30 = @"<nil>";
  }
  v37[7] = v30;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:8];
  [v6 addEntriesFromDictionary:v31];

  for (uint64_t i = 0; i != 40; ++i)
  {
    if ((unint64_t)(i - 1) <= 0x26)
    {
      if ((unint64_t)(i - 1) >= 0x27)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Invalid GEOFilePath (%d)", i);
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = off_1E53E5448[i - 1];
      }
      v34 = +[GEOFilePaths pathFor:i];
      [v6 setObject:v34 forKeyedSubscript:v33];
    }
  }

  return v6;
}

+ (NSString)preferencesDirectoryPath
{
  return (NSString *)[a1 pathFor:9];
}

+ (NSString)geodCacheDirectoryPath
{
  return (NSString *)[a1 pathFor:4];
}

+ (NSString)requestCountsDBFilePath
{
  return (NSString *)[a1 pathFor:26];
}

+ (NSString)locationShifterDBFilePath
{
  return (NSString *)[a1 pathFor:25];
}

+ (NSURL)imageServiceDBFileURL
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = [a1 pathFor:28];
  uint64_t v4 = [v2 fileURLWithPath:v3 isDirectory:0];

  return (NSURL *)v4;
}

+ (NSString)analyticsUploadDirectoryPath
{
  return (NSString *)[a1 pathFor:15];
}

+ (NSString)mapsSuggestionsCacheDirectoryPath
{
  return (NSString *)[a1 pathFor:22];
}

+ (NSString)analyticsPipelineFilePath
{
  return (NSString *)[a1 pathFor:27];
}

+ (BOOL)createDirectoryCopyingAttributesFromParent:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    BOOL v25 = 1;
    goto LABEL_26;
  }
  id v8 = v5;
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v9 fileExistsAtPath:v8])
  {
    uint64_t v10 = (uint64_t)v8;
LABEL_9:

    v11 = (void *)v10;
  }
  else
  {
    v11 = v8;
    while (1)
    {
      unint64_t v12 = [v11 length];

      if (v12 < 6) {
        break;
      }
      uint64_t v10 = [v11 stringByDeletingLastPathComponent];

      v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      v11 = (void *)v10;
      if ([v9 fileExistsAtPath:v10]) {
        goto LABEL_9;
      }
    }
  }
  uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v13 fileExistsAtPath:v11])
  {
    unint64_t v14 = [v11 length];

    if (v14 >= 6)
    {
      uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v28 = 0;
      uint64_t v16 = [v15 attributesOfItemAtPath:v11 error:&v28];
      id v17 = v28;

      if (!v16 || v17)
      {
        v18 = GEOGetGEOFilePathsLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = [v11 fileSystemRepresentation];
          *(_DWORD *)buf = 136446466;
          uint64_t v30 = v19;
          __int16 v31 = 2112;
          id v32 = v17;
          _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "Unable to get attributes for %{public}s: %@", buf, 0x16u);
        }
      }
      goto LABEL_19;
    }
  }
  else
  {
  }
  id v17 = 0;
  uint64_t v16 = 0;
LABEL_19:
  NSLog(&cfstr_CreatingWithAt.isa, v8, v16);
  v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v27 = v17;
  char v21 = [v20 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:v16 error:&v27];
  id v22 = v27;

  if ((v21 & 1) == 0)
  {
    v23 = GEOGetGEOFilePathsLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = [v8 fileSystemRepresentation];
      *(_DWORD *)buf = 136446466;
      uint64_t v30 = v24;
      __int16 v31 = 2112;
      id v32 = v22;
      _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "Unable to create parent directory at %{public}s: %@", buf, 0x16u);
    }
  }
  if (a4) {
    *a4 = v22;
  }
  BOOL v25 = v22 == 0;

LABEL_26:
  return v25;
}

- (void).cxx_destruct
{
}

@end