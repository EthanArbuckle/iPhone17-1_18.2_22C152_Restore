@interface QLExternalThumbnailCache
+ (id)writeThumbnailImage:(CGImage *)a3 inInboxAtURL:(id)a4;
- (BOOL)_createDirectoryWithURL:(id)a3 error:(id *)a4;
- (BOOL)_freeDiskSpaceToSaveThumbnailRepresentingFPItem:(id)a3 withFileAtURL:(id)a4 error:(id *)a5;
- (BOOL)_saveOrUpdateCachedThumbnailRepresentingFPItem:(id)a3 withFileAtURL:(id)a4 error:(id *)a5;
- (BOOL)_saveToDiskCachedThumbnailRepresentingFPItem:(id)a3 withFileAtURL:(id)a4 error:(id *)a5;
- (BOOL)_updateDatabaseWithCachedThumbnailRepresentingFPItem:(id)a3 withFileAtURL:(id)a4 error:(id *)a5;
- (BOOL)removeAllThumbnails:(id *)a3;
- (BOOL)storeThumbnailAtURL:(id)a3 forItem:(id)a4 error:(id *)a5;
- (NSURL)databaseURL;
- (NSURL)directoryURL;
- (NSURL)thumbnailsDirectoryURL;
- (QLExternalThumbnailCache)initWithDirectoryURL:(id)a3 maximumCacheSize:(unint64_t)a4 error:(id *)a5;
- (QLExternalThumbnailCacheDatabase)db;
- (id)_urlForThumbnailWithFPItem:(id)a3 originalThumbnailURL:(id)a4;
- (id)_urlForThumbnailWithFPItemIdentifier:(id)a3 fileExtension:(id)a4;
- (id)inboxDirectoryURL;
- (id)thumbnailURLForItem:(id)a3 error:(id *)a4;
- (id)writeThumbnailImageInInbox:(CGImage *)a3;
- (unint64_t)maximumCacheSize;
- (void)close;
- (void)dealloc;
- (void)getThumbnailCacheURLWrappersWithCompletion:(id)a3;
- (void)getThumbnailURLForItem:(id)a3 completion:(id)a4;
- (void)inboxDirectoryURL;
- (void)setDb:(id)a3;
- (void)storeThumbnailAtURL:(id)a3 forItem:(id)a4 completion:(id)a5;
@end

@implementation QLExternalThumbnailCache

- (QLExternalThumbnailCache)initWithDirectoryURL:(id)a3 maximumCacheSize:(unint64_t)a4 error:(id *)a5
{
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)QLExternalThumbnailCache;
  v10 = [(QLExternalThumbnailCache *)&v18 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_4;
  }
  v10->_maximumCacheSize = a4;
  objc_storeStrong((id *)&v10->_directoryURL, a3);
  uint64_t v12 = [v9 URLByAppendingPathComponent:@"thumbnails" isDirectory:1];
  thumbnailsDirectoryURL = v11->_thumbnailsDirectoryURL;
  v11->_thumbnailsDirectoryURL = (NSURL *)v12;

  uint64_t v14 = [v9 URLByAppendingPathComponent:@"thumbnails.db"];
  databaseURL = v11->_databaseURL;
  v11->_databaseURL = (NSURL *)v14;

  if (![(QLExternalThumbnailCache *)v11 _createDirectoryWithURL:v11->_thumbnailsDirectoryURL error:a5])goto LABEL_5; {
  if ([(QLExternalThumbnailCache *)v11 _createDirectoryWithURL:v11->_directoryURL error:a5])
  }
  {
LABEL_4:
    v16 = v11;
  }
  else
  {
LABEL_5:
    v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  [(QLExternalThumbnailCache *)self close];
  v3.receiver = self;
  v3.super_class = (Class)QLExternalThumbnailCache;
  [(QLExternalThumbnailCache *)&v3 dealloc];
}

- (id)thumbnailURLForItem:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(QLExternalThumbnailCache *)self db];
  if ([v7 open])
  {
    id v14 = 0;
    v8 = [v7 pathExtensionForItem:v6 error:&v14];
    id v9 = v14;
    v10 = v9;
    if (v8)
    {
      v11 = [v6 itemIdentifier];
      uint64_t v12 = [(QLExternalThumbnailCache *)self _urlForThumbnailWithFPItemIdentifier:v11 fileExtension:v8];
    }
    else
    {
      if (v9)
      {
        if (a4)
        {
          errorWithCodeAndUnderlyingError(1, v9);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        v11 = _log_1();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[QLExternalThumbnailCache thumbnailURLForItem:error:]();
        }
      }
      else
      {
        v11 = _log_1();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v16 = v6;
          _os_log_impl(&dword_1B281E000, v11, OS_LOG_TYPE_INFO, "No path extension found from DB for item: %@.", buf, 0xCu);
        }
      }
      uint64_t v12 = 0;
    }
  }
  else
  {
    if (a4)
    {
      errorWithCodeAndUnderlyingError(0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = _log_1();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCache thumbnailURLForItem:error:]();
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)storeThumbnailAtURL:(id)a3 forItem:(id)a4 error:(id *)a5
{
  return [(QLExternalThumbnailCache *)self _saveOrUpdateCachedThumbnailRepresentingFPItem:a4 withFileAtURL:a3 error:a5];
}

- (void)storeThumbnailAtURL:(id)a3 forItem:(id)a4 completion:(id)a5
{
  id v10 = 0;
  v8 = (void (**)(id, id))a5;
  [(QLExternalThumbnailCache *)self storeThumbnailAtURL:a3 forItem:a4 error:&v10];
  id v9 = v10;
  v8[2](v8, v9);
}

- (void)getThumbnailURLForItem:(id)a3 completion:(id)a4
{
  id v9 = 0;
  id v6 = (void (**)(id, void *, id))a4;
  v7 = [(QLExternalThumbnailCache *)self thumbnailURLForItem:a3 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (BOOL)removeAllThumbnails:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v5 = [(QLExternalThumbnailCache *)self db];
  if (([v5 open] & 1) == 0)
  {
    if (a3)
    {
      errorWithCodeAndUnderlyingError(0, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = _log_1();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCache removeAllThumbnails:](v7);
    }
LABEL_17:
    BOOL v20 = 0;
    goto LABEL_33;
  }
  id v32 = 0;
  char v6 = [v5 removeAllThumbnails:&v32];
  v7 = v32;
  if ((v6 & 1) == 0)
  {
    if (a3)
    {
      errorWithCodeAndUnderlyingError(1, v7);
      BOOL v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    goto LABEL_17;
  }
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  thumbnailsDirectoryURL = self->_thumbnailsDirectoryURL;
  v31 = v7;
  id v10 = [v8 contentsOfDirectoryAtURL:thumbnailsDirectoryURL includingPropertiesForKeys:0 options:0 error:&v31];
  v11 = v31;

  if (v10)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v24 = a3;
      v25 = v10;
      uint64_t v15 = *(void *)v28;
      while (2)
      {
        uint64_t v16 = 0;
        uint64_t v17 = v11;
        do
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * v16);
          v26 = v17;
          char v19 = [v8 removeItemAtURL:v18 error:&v26];
          v11 = v26;

          if ((v19 & 1) == 0)
          {
            v21 = _log_1();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              -[QLExternalThumbnailCache removeAllThumbnails:]();
            }

            if (v24)
            {
              errorWithCodeAndUnderlyingError(3, v11);
              BOOL v20 = 0;
              id *v24 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              BOOL v20 = 0;
            }
            goto LABEL_30;
          }
          ++v16;
          uint64_t v17 = v11;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v14) {
          continue;
        }
        break;
      }
      BOOL v20 = 1;
LABEL_30:
      id v10 = v25;
    }
    else
    {
      BOOL v20 = 1;
    }
  }
  else
  {
    v22 = _log_1();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCache removeAllThumbnails:]();
    }

    if (a3)
    {
      errorWithCodeAndUnderlyingError(3, v11);
      BOOL v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v20 = 0;
    }
  }

  v7 = v11;
LABEL_33:

  return v20;
}

- (void)close
{
}

- (BOOL)_saveOrUpdateCachedThumbnailRepresentingFPItem:(id)a3 withFileAtURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(QLExternalThumbnailCache *)self _freeDiskSpaceToSaveThumbnailRepresentingFPItem:v8 withFileAtURL:v9 error:a5]&& [(QLExternalThumbnailCache *)self _updateDatabaseWithCachedThumbnailRepresentingFPItem:v8 withFileAtURL:v9 error:a5]&& [(QLExternalThumbnailCache *)self _saveToDiskCachedThumbnailRepresentingFPItem:v8 withFileAtURL:v9 error:a5];

  return v10;
}

- (BOOL)_freeDiskSpaceToSaveThumbnailRepresentingFPItem:(id)a3 withFileAtURL:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(QLExternalThumbnailCache *)self db];
  if (([v10 open] & 1) == 0)
  {
    if (a5)
    {
      errorWithCodeAndUnderlyingError(0, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v15 = _log_1();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCache _freeDiskSpaceToSaveThumbnailRepresentingFPItem:withFileAtURL:error:]();
    }
    goto LABEL_11;
  }
  unint64_t v11 = [(QLExternalThumbnailCache *)self maximumCacheSize];
  uint64_t v12 = [v10 totalThumbnailsSize];
  uint64_t v13 = [v9 _QLFileSize];
  unint64_t v14 = [v13 longLongValue];

  if (v14 > v11)
  {
    if (a5)
    {
      errorWithCodeAndUnderlyingError(4, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v15 = _log_1();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCache _freeDiskSpaceToSaveThumbnailRepresentingFPItem:withFileAtURL:error:]();
    }
LABEL_11:
    char v16 = 0;
    goto LABEL_12;
  }
  uint64_t v18 = v14 + v12 - v11;
  if (v18 < 1)
  {
    char v16 = 1;
    goto LABEL_13;
  }
  id v44 = 0;
  char v19 = [v10 deleteOldestThumbnailsToFreeAtLeastSpace:v18 & ~(v18 >> 63) error:&v44];
  uint64_t v15 = v44;
  if (v19)
  {
    id v20 = v8;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obj = v19;
    uint64_t v21 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      v33 = v19;
      uint64_t v34 = a5;
      v35 = v10;
      v36 = v9;
      v37 = v20;
      uint64_t v23 = *(void *)v41;
      char v16 = 1;
      do
      {
        uint64_t v24 = 0;
        v25 = v15;
        do
        {
          if (*(void *)v41 != v23) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v40 + 1) + 8 * v24);
          long long v27 = [v26 itemIdentifier];
          long long v28 = [v26 fileExtension];
          long long v29 = [(QLExternalThumbnailCache *)self _urlForThumbnailWithFPItemIdentifier:v27 fileExtension:v28];

          long long v30 = [MEMORY[0x1E4F28CB8] defaultManager];
          v39 = v25;
          char v31 = [v30 removeItemAtURL:v29 error:&v39];
          uint64_t v15 = v39;

          if ((v31 & 1) == 0)
          {
            id v32 = _log_1();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v47 = v29;
              __int16 v48 = 2112;
              v49 = v15;
              _os_log_error_impl(&dword_1B281E000, v32, OS_LOG_TYPE_ERROR, "Could not delete cached thumbnail at URL: %@. Error: %@.", buf, 0x16u);
            }

            char v16 = 0;
          }

          ++v24;
          v25 = v15;
        }
        while (v22 != v24);
        uint64_t v22 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v22);
      id v9 = v36;
      id v8 = v37;
      a5 = v34;
      BOOL v10 = v35;
      char v19 = v33;
    }
    else
    {
      char v16 = 1;
    }
  }
  else
  {
    obj = _log_1();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v47 = v8;
      __int16 v48 = 2112;
      v49 = v9;
      __int16 v50 = 2112;
      v51 = v15;
      _os_log_error_impl(&dword_1B281E000, obj, OS_LOG_TYPE_ERROR, "_freeDiskSpaceToSaveThumbnailRepresentingFPItem (item: %@, url: %@) failed. Error: %@", buf, 0x20u);
    }
    char v16 = 0;
  }

  if (a5) {
    *a5 = v15;
  }

LABEL_12:
LABEL_13:

  return v16 & 1;
}

- (BOOL)_updateDatabaseWithCachedThumbnailRepresentingFPItem:(id)a3 withFileAtURL:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(QLExternalThumbnailCache *)self db];
  if ([v10 open])
  {
    unint64_t v11 = [v9 _QLFileSize];
    uint64_t v12 = [v11 longLongValue];

    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    unint64_t v14 = [v9 pathExtension];
    id v19 = 0;
    char v15 = [v10 insertOrReplaceThumbnailRepresentingFPItem:v8 size:v12 modificationDate:v13 fileExtension:v14 error:&v19];
    char v16 = v19;

    if ((v15 & 1) == 0)
    {
      if (a5) {
        *a5 = v16;
      }
      uint64_t v17 = _log_1();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v21 = v8;
        __int16 v22 = 2112;
        id v23 = v9;
        __int16 v24 = 2112;
        v25 = v16;
        _os_log_error_impl(&dword_1B281E000, v17, OS_LOG_TYPE_ERROR, "_updateDatabaseWithCachedThumbnailRepresentingFPItem (item: %@, url: %@) failed. Error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    if (a5)
    {
      errorWithCodeAndUnderlyingError(0, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    char v16 = _log_1();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCache _updateDatabaseWithCachedThumbnailRepresentingFPItem:withFileAtURL:error:]();
    }
    char v15 = 0;
  }

  return v15;
}

- (BOOL)_saveToDiskCachedThumbnailRepresentingFPItem:(id)a3 withFileAtURL:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [(QLExternalThumbnailCache *)self _urlForThumbnailWithFPItem:a3 originalThumbnailURL:v8];
  BOOL v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v11 = [v9 path];
  int v12 = [v10 fileExistsAtPath:v11];

  if (v12)
  {
    id v23 = 0;
    char v13 = [v10 removeItemAtURL:v9 error:&v23];
    id v14 = v23;
    id v15 = v14;
    if ((v13 & 1) == 0)
    {
      if (a5) {
        *a5 = v14;
      }
      char v16 = _log_1();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[QLExternalThumbnailCache _saveToDiskCachedThumbnailRepresentingFPItem:withFileAtURL:error:]();
      }
LABEL_14:

      BOOL v20 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v17 = v15;
  uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v22 = v15;
  char v19 = [v18 moveItemAtURL:v8 toURL:v9 error:&v22];
  id v15 = v22;

  if ((v19 & 1) == 0)
  {
    if (a5) {
      *a5 = v15;
    }
    char v16 = _log_1();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v8;
      __int16 v26 = 2112;
      long long v27 = v9;
      __int16 v28 = 2112;
      id v29 = v15;
      _os_log_error_impl(&dword_1B281E000, v16, OS_LOG_TYPE_ERROR, "Could not save thumbnail at url: %@ to external cache url: %@. Error: %@", buf, 0x20u);
    }
    goto LABEL_14;
  }
  BOOL v20 = 1;
LABEL_15:

  return v20;
}

- (BOOL)_createDirectoryWithURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  char v7 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v11];
  id v8 = v11;

  if ((v7 & 1) == 0)
  {
    id v9 = _log_1();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[QLExternalThumbnailCache _createDirectoryWithURL:error:]();
    }

    if (a4)
    {
      errorWithCodeAndUnderlyingError(2, v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (id)_urlForThumbnailWithFPItem:(id)a3 originalThumbnailURL:(id)a4
{
  id v6 = a4;
  char v7 = [a3 itemIdentifier];
  id v8 = [v6 pathExtension];

  id v9 = [(QLExternalThumbnailCache *)self _urlForThumbnailWithFPItemIdentifier:v7 fileExtension:v8];

  return v9;
}

- (id)_urlForThumbnailWithFPItemIdentifier:(id)a3 fileExtension:(id)a4
{
  thumbnailsDirectoryURL = self->_thumbnailsDirectoryURL;
  id v6 = a4;
  char v7 = [a3 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
  id v8 = [(NSURL *)thumbnailsDirectoryURL URLByAppendingPathComponent:v7];
  id v9 = [v8 URLByAppendingPathExtension:v6];

  return v9;
}

- (QLExternalThumbnailCacheDatabase)db
{
  db = self->_db;
  if (!db)
  {
    v4 = [[QLExternalThumbnailCacheDatabase alloc] initWithURL:self->_databaseURL];
    id v5 = self->_db;
    self->_db = v4;

    db = self->_db;
  }

  return db;
}

- (id)inboxDirectoryURL
{
  v2 = [(NSURL *)self->_directoryURL URLByAppendingPathComponent:@"inbox"];
  if (([v2 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    objc_super v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = 0;
    char v4 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v8];
    id v5 = v8;

    if ((v4 & 1) == 0)
    {
      id v6 = _log_1();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[QLExternalThumbnailCache inboxDirectoryURL]();
      }
    }
  }

  return v2;
}

- (void)getThumbnailCacheURLWrappersWithCompletion:(id)a3
{
  id v5 = a3;
  id FPSandboxingURLWrapperClass = getFPSandboxingURLWrapperClass();
  id v11 = [(QLExternalThumbnailCache *)self inboxDirectoryURL];
  char v7 = [FPSandboxingURLWrapperClass wrapperWithURL:v11 readonly:0 error:0];
  id v8 = getFPSandboxingURLWrapperClass();
  id v9 = [(QLExternalThumbnailCache *)self thumbnailsDirectoryURL];
  BOOL v10 = [v8 wrapperWithURL:v9 readonly:1 error:0];
  (*((void (**)(id, void *, void *))a3 + 2))(v5, v7, v10);
}

+ (id)writeThumbnailImage:(CGImage *)a3 inInboxAtURL:(id)a4
{
  id v5 = a4;
  if (writeThumbnailImage_inInboxAtURL__once != -1) {
    dispatch_once(&writeThumbnailImage_inInboxAtURL__once, &__block_literal_global_9);
  }
  int v6 = [v5 startAccessingSecurityScopedResource];
  CFURLRef v7 = [MEMORY[0x1E4F1CB10] _QLTemporaryURLWithExtension:writeThumbnailImage_inInboxAtURL__fileExtension openingFileHandle:0 inDirectoryAtURL:v5];
  id v8 = CGImageDestinationCreateWithURL(v7, (CFStringRef)writeThumbnailImage_inInboxAtURL__encodingUTI, 1uLL, 0);
  if (v8)
  {
    id v9 = v8;
    CGImageDestinationAddImage(v8, a3, 0);
    if (!CGImageDestinationFinalize(v9))
    {
      BOOL v10 = _log_1();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[QLExternalThumbnailCache writeThumbnailImage:inInboxAtURL:]();
      }

      id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v11 removeItemAtURL:v7 error:0];

      CFURLRef v7 = 0;
    }
    CFRelease(v9);
    if (v6) {
      goto LABEL_9;
    }
  }
  else
  {
    char v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v13 removeItemAtURL:v7 error:0];

    CFURLRef v7 = 0;
    if (v6) {
LABEL_9:
    }
      [v5 stopAccessingSecurityScopedResource];
  }

  return v7;
}

void __61__QLExternalThumbnailCache_writeThumbnailImage_inInboxAtURL___block_invoke()
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  CFArrayRef v0 = CGImageDestinationCopyTypeIdentifiers();
  v1 = [(id)*MEMORY[0x1E4F443E0] identifier];
  uint64_t v30 = v1;
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x2020000000;
  v2 = (id *)getAVFileTypeAVCISymbolLoc_ptr;
  uint64_t v28 = getAVFileTypeAVCISymbolLoc_ptr;
  if (!getAVFileTypeAVCISymbolLoc_ptr)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __getAVFileTypeAVCISymbolLoc_block_invoke;
    id v23 = &unk_1E6009910;
    __int16 v24 = &v25;
    objc_super v3 = (void *)AVFoundationLibrary();
    v26[3] = (uint64_t)dlsym(v3, "AVFileTypeAVCI");
    getAVFileTypeAVCISymbolLoc_ptr = *(void *)(v24[1] + 24);
    v2 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v2)
  {
    +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:]();
    __break(1u);
  }
  id v31 = *v2;
  char v4 = (void *)*MEMORY[0x1E4F44410];
  id v5 = v31;
  int v6 = [v4 identifier];
  id v32 = v6;
  CFURLRef v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:3];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (-[__CFArray containsObject:](v0, "containsObject:", v12, (void)v16))
        {
          objc_storeStrong((id *)&writeThumbnailImage_inInboxAtURL__encodingUTI, v12);
          char v13 = [MEMORY[0x1E4F442D8] typeWithIdentifier:writeThumbnailImage_inInboxAtURL__encodingUTI];
          uint64_t v14 = [v13 preferredFilenameExtension];
          id v15 = (void *)writeThumbnailImage_inInboxAtURL__fileExtension;
          writeThumbnailImage_inInboxAtURL__fileExtension = v14;

          goto LABEL_14;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v29 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  if (!writeThumbnailImage_inInboxAtURL__fileExtension) {
    __61__QLExternalThumbnailCache_writeThumbnailImage_inInboxAtURL___block_invoke_cold_2();
  }
}

- (id)writeThumbnailImageInInbox:(CGImage *)a3
{
  id v5 = objc_opt_class();
  int v6 = [(QLExternalThumbnailCache *)self inboxDirectoryURL];
  CFURLRef v7 = [v5 writeThumbnailImage:a3 inInboxAtURL:v6];

  return v7;
}

- (void)setDb:(id)a3
{
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (NSURL)thumbnailsDirectoryURL
{
  return self->_thumbnailsDirectoryURL;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (unint64_t)maximumCacheSize
{
  return self->_maximumCacheSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_thumbnailsDirectoryURL, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

- (void)thumbnailURLForItem:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Could not obtain path extension from DB for item: %@. Error: %@");
}

- (void)thumbnailURLForItem:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Could not obtain path extension from DB for item: %@ because could not open DB.", v2, v3, v4, v5, v6);
}

- (void)removeAllThumbnails:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Could not delete thumbnails from cache because did not obtain the URLs of the thumbnails returned nil. Error: %@", v2, v3, v4, v5, v6);
}

- (void)removeAllThumbnails:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Could not delete cached thumbnail at URL: %@. Error: %@.");
}

- (void)removeAllThumbnails:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1B281E000, log, OS_LOG_TYPE_ERROR, "removeAllThumbnails failed because could not open DB.", v1, 2u);
}

- (void)_freeDiskSpaceToSaveThumbnailRepresentingFPItem:withFileAtURL:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "_freeDiskSpaceToSaveThumbnailRepresentingFPItem for item: %@ failed because the thumbnails is too large to fit the maximum cache size.", v2, v3, v4, v5, v6);
}

- (void)_freeDiskSpaceToSaveThumbnailRepresentingFPItem:withFileAtURL:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "_freeDiskSpaceToSaveThumbnailRepresentingFPItem for item: %@ failed because could not open DB.", v2, v3, v4, v5, v6);
}

- (void)_updateDatabaseWithCachedThumbnailRepresentingFPItem:withFileAtURL:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Can't save thumbnail at url: %@ for FPItem: %@ because could not open database.");
}

- (void)_saveToDiskCachedThumbnailRepresentingFPItem:withFileAtURL:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Could not remove existing thumbnail from external cache at url: %@. Error: %@");
}

- (void)_createDirectoryWithURL:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Could not create directory at url %@ to store thumbnails on the device (error %@).");
}

- (void)inboxDirectoryURL
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "could not create inbox directory: %@", v2, v3, v4, v5, v6);
}

+ (void)writeThumbnailImage:inInboxAtURL:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Failed storing thumbnail as %@", v2, v3, v4, v5, v6);
}

void __61__QLExternalThumbnailCache_writeThumbnailImage_inInboxAtURL___block_invoke_cold_2()
{
  __assert_rtn("+[QLExternalThumbnailCache writeThumbnailImage:inInboxAtURL:]_block_invoke", "QLExternalThumbnailCache.m", 363, "fileExtension != nil");
}

@end