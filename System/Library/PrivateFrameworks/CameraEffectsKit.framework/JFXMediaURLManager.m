@interface JFXMediaURLManager
+ (BOOL)ODRAssetsAreEmbedded;
+ (BOOL)_createDirectoryAtURL:(id)a3 error:(id *)a4;
+ (id)_audioRecordingURL:(id *)a3;
+ (id)_capturedPhotoURL:(id *)a3 isHEIF:(BOOL)a4;
+ (id)_photoExportURL:(id *)a3 isHEIF:(BOOL)a4;
+ (id)_tempFileURLWithDirectory:(id)a3 file:(id)a4 error:(id *)a5;
+ (id)_temporaryPhotoURL:(id *)a3 fileName:(id)a4;
+ (id)_videoExportURL:(id *)a3;
+ (id)audioRecordingURL:(id *)a3;
+ (id)cachedExportFileURLWithError:(id *)a3;
+ (id)capturedPhotoURL:(id *)a3 isHEIF:(BOOL)a4;
+ (id)photoExportURL:(id *)a3 isHEIF:(BOOL)a4;
+ (id)sharedInstance;
+ (id)temporaryPhotoURL:(id *)a3 fileName:(id)a4;
+ (id)videoExportURL:(id *)a3;
+ (id)videoRecordingFolderURL:(id *)a3;
+ (void)_cleanupDirectory:(id)a3;
+ (void)cleanupTemporaryDirectories;
+ (void)jfx_cleanupOldProjects;
- (JTFileURLSource)urlSource;
- (void)setUrlSource:(id)a3;
@end

@implementation JFXMediaURLManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1) {
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_60);
  }
  v2 = (void *)sharedInstance_fileManager;
  return v2;
}

uint64_t __36__JFXMediaURLManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(JFXMediaURLManager);
  uint64_t v1 = sharedInstance_fileManager;
  sharedInstance_fileManager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)videoRecordingFolderURL:(id *)a3
{
  v5 = [a1 _tempFileURLWithDirectory:@"VideoRecordings" file:@"foo.bar" error:a3];
  v6 = [v5 URLByDeletingLastPathComponent];

  if (v6 && !*a3 && (![a1 _createDirectoryAtURL:v6 error:a3] || *a3))
  {

    v6 = 0;
  }
  return v6;
}

+ (id)videoExportURL:(id *)a3
{
  v5 = objc_msgSend(a1, "_videoExportURL:");
  v6 = v5;
  if (v5)
  {
    if (!*a3)
    {
      v7 = [v5 URLByDeletingLastPathComponent];
      int v8 = [a1 _createDirectoryAtURL:v7 error:a3];

      if (!v8 || *a3)
      {

        v6 = 0;
      }
    }
  }
  return v6;
}

+ (id)capturedPhotoURL:(id *)a3 isHEIF:(BOOL)a4
{
  v6 = [a1 _capturedPhotoURL:a3 isHEIF:a4];
  v7 = v6;
  if (v6)
  {
    if (!*a3)
    {
      int v8 = [v6 URLByDeletingLastPathComponent];
      int v9 = [a1 _createDirectoryAtURL:v8 error:a3];

      if (!v9 || *a3)
      {

        v7 = 0;
      }
    }
  }
  return v7;
}

+ (id)photoExportURL:(id *)a3 isHEIF:(BOOL)a4
{
  v6 = [a1 _photoExportURL:a3 isHEIF:a4];
  v7 = v6;
  if (v6)
  {
    if (!*a3)
    {
      int v8 = [v6 URLByDeletingLastPathComponent];
      int v9 = [a1 _createDirectoryAtURL:v8 error:a3];

      if (!v9 || *a3)
      {

        v7 = 0;
      }
    }
  }
  return v7;
}

+ (id)temporaryPhotoURL:(id *)a3 fileName:(id)a4
{
  v6 = [a1 _temporaryPhotoURL:a3 fileName:a4];
  v7 = v6;
  if (v6)
  {
    if (!*a3)
    {
      int v8 = [v6 URLByDeletingLastPathComponent];
      int v9 = [a1 _createDirectoryAtURL:v8 error:a3];

      if (!v9 || *a3)
      {

        v7 = 0;
      }
    }
  }
  return v7;
}

+ (id)audioRecordingURL:(id *)a3
{
  v5 = objc_msgSend(a1, "_audioRecordingURL:");
  v6 = v5;
  if (v5)
  {
    if (!*a3)
    {
      v7 = [v5 URLByDeletingLastPathComponent];
      int v8 = [a1 _createDirectoryAtURL:v7 error:a3];

      if (!v8 || *a3)
      {

        v6 = 0;
      }
    }
  }
  return v6;
}

+ (id)cachedExportFileURLWithError:(id *)a3
{
  v5 = +[JFXMediaURLManager sharedInstance];
  v6 = [v5 urlSource];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = +[JFXMediaURLManager sharedInstance];
    int v9 = [v8 urlSource];
    id v10 = [v9 cachedExportFileURLWithError:a3];

    if (!v10) {
      goto LABEL_12;
    }
    char v20 = 0;
    v11 = [MEMORY[0x263F08850] defaultManager];
    v12 = [v10 path];
    int v13 = [v11 fileExistsAtPath:v12 isDirectory:&v20];

    if (v13 && v20) {
      goto LABEL_11;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08850] defaultManager];
    id v10 = [v14 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:a3];

    if (!v10 || a3 && *a3) {
      goto LABEL_12;
    }
    v15 = [MEMORY[0x263F086E0] mainBundle];
    v16 = [v15 bundleIdentifier];

    v17 = [v10 URLByAppendingPathComponent:v16 isDirectory:1];

    id v10 = [v17 URLByAppendingPathComponent:@"Exports" isDirectory:1];
  }
  if ([a1 _createDirectoryAtURL:v10 error:a3])
  {
LABEL_11:
    id v10 = v10;
    v18 = v10;
    goto LABEL_13;
  }
LABEL_12:
  v18 = 0;
LABEL_13:

  return v18;
}

+ (void)jfx_cleanupOldProjects
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = NSTemporaryDirectory();
  v5 = [v3 contentsOfDirectoryAtPath:v4 error:0];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        id v19 = 0;
        v12 = [a1 cachedExportFileURLWithError:&v19];
        id v13 = v19;
        v14 = [v12 lastPathComponent];

        if (([v11 isEqualToString:v14] & 1) == 0)
        {
          v15 = NSURL;
          v16 = NSTemporaryDirectory();
          v17 = [v16 stringByAppendingPathComponent:v11];
          v18 = [v15 fileURLWithPath:v17];
          [a1 _cleanupDirectory:v18];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
}

+ (void)cleanupTemporaryDirectories
{
  objc_msgSend(a1, "jfx_cleanupOldProjects");
  uint64_t v10 = 0;
  v3 = [a1 videoRecordingFolderURL:&v10];
  if (v3) {
    [a1 _cleanupDirectory:v3];
  }
  v4 = [a1 _capturedPhotoURL:0 isHEIF:0];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 URLByDeletingLastPathComponent];
    [a1 _cleanupDirectory:v6];
  }
  uint64_t v7 = [a1 _audioRecordingURL:0];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 URLByDeletingLastPathComponent];
    [a1 _cleanupDirectory:v9];
  }
}

+ (id)_videoExportURL:(id *)a3
{
  return (id)[a1 _tempFileURLWithDirectory:@"Exports" file:@"video.mov" error:a3];
}

+ (id)_temporaryPhotoURL:(id *)a3 fileName:(id)a4
{
  id v6 = (__CFString *)a4;
  uint64_t v7 = v6;
  uint64_t v8 = @"photo";
  if (v6 && [(__CFString *)v6 length]) {
    uint64_t v8 = v7;
  }
  uint64_t v9 = [NSString stringWithFormat:@"%@.png", v8];
  uint64_t v10 = [a1 _tempFileURLWithDirectory:@"TemporaryPhotos" file:v9 error:a3];

  return v10;
}

+ (id)_capturedPhotoURL:(id *)a3 isHEIF:(BOOL)a4
{
  id v6 = @"jpg";
  if (a4) {
    id v6 = @"heic";
  }
  uint64_t v7 = [NSString stringWithFormat:@"photo.%@", v6];
  uint64_t v8 = [a1 _tempFileURLWithDirectory:@"CapturedPhotos" file:v7 error:a3];

  return v8;
}

+ (id)_photoExportURL:(id *)a3 isHEIF:(BOOL)a4
{
  id v6 = @"jpg";
  if (a4) {
    id v6 = @"heic";
  }
  uint64_t v7 = [NSString stringWithFormat:@"photo.%@", v6];
  uint64_t v8 = [a1 _tempFileURLWithDirectory:@"Exports" file:v7 error:a3];

  return v8;
}

+ (id)_audioRecordingURL:(id *)a3
{
  return (id)[a1 _tempFileURLWithDirectory:@"AudioRecordings" file:@"audio.caf" error:a3];
}

+ (void)_cleanupDirectory:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08850] defaultManager];
  id v29 = 0;
  v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:0 error:&v29];
  id v6 = v29;

  if (v6)
  {
    uint64_t v7 = [v6 domain];
    if ([v7 isEqual:*MEMORY[0x263F07F70]])
    {
      uint64_t v8 = [v6 code];

      if (v8 == 260) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    v12 = JFXLog_file();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[JFXMediaURLManager _cleanupDirectory:v12];
    }
  }
  else
  {
    if ([v5 count])
    {
      uint64_t v9 = JFXLog_modelAssetManagement();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v3 lastPathComponent];
        int v11 = [v5 count];
        *(_DWORD *)buf = 138412546;
        v31 = v10;
        __int16 v32 = 1024;
        LODWORD(v33) = v11;
        _os_log_impl(&dword_234C41000, v9, OS_LOG_TYPE_DEFAULT, "clean up directory %@: %u items", buf, 0x12u);
      }
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      long long v22 = v5;
      id v23 = v3;
      id v6 = 0;
      uint64_t v15 = *(void *)v26;
      do
      {
        uint64_t v16 = 0;
        v17 = v6;
        do
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          v18 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
          id v19 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v22, v23);
          id v24 = v17;
          char v20 = [v19 removeItemAtURL:v18 error:&v24];
          id v6 = v24;

          if ((v20 & 1) == 0)
          {
            long long v21 = JFXLog_file();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v31 = v18;
              __int16 v32 = 2112;
              id v33 = v6;
              _os_log_debug_impl(&dword_234C41000, v21, OS_LOG_TYPE_DEBUG, "Error removing %@ %@", buf, 0x16u);
            }
          }
          ++v16;
          v17 = v6;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v14);
      v5 = v22;
      id v3 = v23;
    }
    else
    {
      id v6 = 0;
    }
  }

LABEL_26:
}

+ (id)_tempFileURLWithDirectory:(id)a3 file:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  id v10 = [v9 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:a5];

  if (!v10 || a5 && *a5)
  {
    int v11 = 0;
  }
  else
  {
    v12 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v13 = [v12 bundleIdentifier];

    uint64_t v14 = [v10 URLByAppendingPathComponent:v13 isDirectory:1];

    uint64_t v15 = [v14 URLByAppendingPathComponent:v7 isDirectory:1];

    uint64_t v16 = [v15 URLByAppendingPathComponent:v8 isDirectory:0];

    v17 = [MEMORY[0x263F08850] defaultManager];
    v18 = [v16 path];
    int v19 = [v17 fileExistsAtPath:v18];

    if (v19)
    {
      char v20 = [MEMORY[0x263F08850] defaultManager];
      [v20 removeItemAtURL:v16 error:0];
    }
    id v10 = v16;

    int v11 = v10;
  }

  return v11;
}

+ (BOOL)_createDirectoryAtURL:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F08850];
  id v6 = a3;
  id v7 = [v5 defaultManager];
  LOBYTE(a4) = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:a4];

  return (char)a4;
}

+ (BOOL)ODRAssetsAreEmbedded
{
  if (ODRAssetsAreEmbedded_onceToken != -1) {
    dispatch_once(&ODRAssetsAreEmbedded_onceToken, &__block_literal_global_43);
  }
  return ODRAssetsAreEmbedded_isEmbedded;
}

void __42__JFXMediaURLManager_ODRAssetsAreEmbedded__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v1 = [v0 bundlePath];
  v2 = [v1 stringByAppendingPathComponent:@"OnDemandResources"];

  char v5 = 0;
  id v3 = [MEMORY[0x263F08850] defaultManager];
  LODWORD(v1) = [v3 fileExistsAtPath:v2 isDirectory:&v5];

  if (v1) {
    BOOL v4 = v5 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    ODRAssetsAreEmbedded_isEmbedded = 1;
  }
}

- (JTFileURLSource)urlSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_urlSource);
  return (JTFileURLSource *)WeakRetained;
}

- (void)setUrlSource:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)_cleanupDirectory:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "Error getting temporary directory contents %@ %@", (uint8_t *)&v3, 0x16u);
}

@end