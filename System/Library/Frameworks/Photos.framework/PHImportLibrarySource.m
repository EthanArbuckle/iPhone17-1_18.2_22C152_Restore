@interface PHImportLibrarySource
+ (BOOL)_isValidPhotoLibrary:(id)a3 error:(id *)a4;
+ (id)importLibrarySourceForURL:(id)a3 exceptions:(id *)a4;
+ (id)supportedImportLibraryTypes;
- (BOOL)_isValidPhotoLibraryWithError:(id *)a3;
- (BOOL)canReference;
- (BOOL)containsSupportedMediaWithImportExceptions:(id *)a3;
- (BOOL)isLibrary;
- (PHImportLibrarySource)initWithURLs:(id)a3;
- (PLPhotoLibraryPathManager)pathManager;
- (id)_resourcePathsByUuidForPaths:(id)a3;
- (id)assetsByProcessingItem:(id)a3;
- (id)name;
- (id)productKind;
- (void)beginProcessingWithCompletion:(id)a3;
- (void)loadSidecarsFor:(id)a3;
- (void)setPathManager:(id)a3;
@end

@implementation PHImportLibrarySource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_renderResourcePathsByIdentifier, 0);

  objc_storeStrong((id *)&self->_libraryURL, 0);
}

- (void)setPathManager:(id)a3
{
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (BOOL)_isValidPhotoLibraryWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F8AA90];
  v5 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
  v6 = [v4 sharedAssetsdClientForPhotoLibraryURL:v5];

  v7 = [v6 libraryClient];
  id v13 = 0;
  char v8 = [v7 isLibraryReadyForImportWithError:&v13];
  id v9 = v13;

  if (a3 && (v8 & 1) == 0)
  {
    PHErrorFromPLError(v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v10 = PLImportGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = *a3;
      *(_DWORD *)buf = 136446466;
      v15 = "-[PHImportLibrarySource _isValidPhotoLibraryWithError:]";
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEBUG, "ERROR: %{public}s Library not valid for import. Error: %@", buf, 0x16u);
    }
  }
  return v8;
}

- (id)name
{
  v2 = [(PHImportUrlSource *)self prefix];
  v3 = [v2 lastPathComponent];
  v4 = [v3 stringByDeletingPathExtension];

  return v4;
}

- (BOOL)isLibrary
{
  return 1;
}

- (BOOL)canReference
{
  return 0;
}

- (id)productKind
{
  return @"Library";
}

- (void)loadSidecarsFor:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = PLImportGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[PHImportLibrarySource loadSidecarsFor:]";
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "%s should never be called on an PHImportLibrarySource", (uint8_t *)&v4, 0xCu);
  }
}

- (id)assetsByProcessingItem:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PHImportUrlSource *)self resourcePathsByIdentifier];
  v37 = v4;
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  v7 = (void *)[v6 mutableCopy];

  char v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];
        v15 = +[PHImportAsset assetFileForURL:v14 source:self withUuid:0];

        if (v15)
        {
          if ([v15 isSidecar]) {
            [v8 insertObject:v15 atIndex:0];
          }
          else {
            [v8 addObject:v15];
          }
        }
        else
        {
          __int16 v16 = [v13 lastPathComponent];
          id v17 = [(PHImportExceptionRecorder *)self addExceptionWithType:1 path:v16 underlyingError:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportLibrarySource.m" line:132];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v10);
  }

  uint64_t v18 = [(NSDictionary *)self->_renderResourcePathsByIdentifier objectForKeyedSubscript:v37];
  v19 = (void *)[v18 mutableCopy];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v35 = v19;
  uint64_t v20 = [v35 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v35);
        }
        v24 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v24];
        v26 = +[PHImportAsset assetFileForURL:v25 source:self withUuid:v37];

        if (!v26)
        {
          v27 = [v24 lastPathComponent];
          id v28 = [(PHImportExceptionRecorder *)self addExceptionWithType:1 path:v27 underlyingError:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportLibrarySource.m" line:158];

          goto LABEL_31;
        }
        if ([v26 isSidecar])
        {
          [v8 insertObject:v26 atIndex:0];
          goto LABEL_31;
        }
        if ([v26 isImage])
        {
          BOOL v29 = [v26 isBase] == 0;
          uint64_t v30 = 5;
          uint64_t v31 = 8;
LABEL_26:
          if (v29) {
            uint64_t v32 = v30;
          }
          else {
            uint64_t v32 = v31;
          }
          [v26 setResourceType:v32];
          goto LABEL_30;
        }
        if ([v26 isMovie])
        {
          BOOL v29 = [v26 isBase] == 0;
          uint64_t v30 = 6;
          uint64_t v31 = 12;
          goto LABEL_26;
        }
LABEL_30:
        [v8 addObject:v26];
LABEL_31:
      }
      uint64_t v21 = [v35 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v21);
  }

  if ([v8 count])
  {
    v33 = [(PHImportSource *)self processAssets:v8];
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void)beginProcessingWithCompletion:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  pathManager = self->_pathManager;
  v5 = (void (**)(void))a3;
  uint64_t v6 = [(PLPhotoLibraryPathManager *)pathManager photoDirectoryWithType:4];
  v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  v24[0] = v7;
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  uint64_t v9 = [(PHImportUrlSource *)self resourcePathsInUrls:v8];

  uint64_t v10 = [(PHImportLibrarySource *)self _resourcePathsByUuidForPaths:v9];
  [(PHImportUrlSource *)self setResourcePathsByIdentifier:v10];

  uint64_t v11 = [(PLPhotoLibraryPathManager *)self->_pathManager photoDirectoryWithType:9];
  v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
  v23 = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v14 = [(PHImportUrlSource *)self resourcePathsInUrls:v13];

  v15 = [(PHImportLibrarySource *)self _resourcePathsByUuidForPaths:v14];
  renderResourcePathsByIdentifier = self->_renderResourcePathsByIdentifier;
  self->_renderResourcePathsByIdentifier = v15;

  id v17 = [(PHImportUrlSource *)self resourcePathsByIdentifier];
  uint64_t v18 = [v17 allKeys];
  v19 = (void *)[v18 mutableCopy];
  [(PHImportSource *)self setItems:v19];

  uint64_t v20 = [(PHImportSource *)self items];
  uint64_t v21 = [v20 count];
  uint64_t v22 = [(PHImportSource *)self progress];
  [v22 setTotalUnitCount:v21];

  v5[2](v5);
}

- (id)_resourcePathsByUuidForPaths:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1E4F8B978];
        v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", v10, (void)v16);
        id v13 = [v11 uuidFromURL:v12];

        v14 = [v4 objectForKeyedSubscript:v13];
        if (!v14)
        {
          v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", (unint64_t)objc_msgSend(v5, "count") >> 1);
          [v4 setObject:v14 forKeyedSubscript:v13];
        }
        [v14 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)containsSupportedMediaWithImportExceptions:(id *)a3
{
  return 1;
}

- (PHImportLibrarySource)initWithURLs:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count] == 1
    && (v11.receiver = self,
        v11.super_class = (Class)PHImportLibrarySource,
        (self = [(PHImportUrlSource *)&v11 initWithURLs:v4]) != 0))
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    libraryURL = self->_libraryURL;
    self->_libraryURL = v5;

    uint64_t v7 = (PLPhotoLibraryPathManager *)[objc_alloc(MEMORY[0x1E4F8B980]) initWithLibraryURL:self->_libraryURL];
    pathManager = self->_pathManager;
    self->_pathManager = v7;

    [(PHImportUrlSource *)self setIsReadonlyVolume:1];
  }
  else
  {
    uint64_t v9 = PLImportGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEBUG, "Unexpected: Attempting to create a library import source with more than on URL: %@", buf, 0xCu);
    }

    self = 0;
  }

  return self;
}

+ (BOOL)_isValidPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F8AA90] sharedAssetsdClientForPhotoLibraryURL:a3];
  uint64_t v6 = [v5 libraryClient];
  id v12 = 0;
  char v7 = [v6 isLibraryReadyForImportWithError:&v12];
  id v8 = v12;

  if (a4 && (v7 & 1) == 0)
  {
    PHErrorFromPLError(v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = PLImportGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = *a4;
      *(_DWORD *)buf = 136446466;
      uint64_t v14 = "+[PHImportLibrarySource _isValidPhotoLibrary:error:]";
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "ERROR: %{public}s Library not valid for import. Error: %@", buf, 0x16u);
    }
  }
  return v7;
}

+ (id)supportedImportLibraryTypes
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F8CDF8] photosLibraryType];
  id v3 = objc_msgSend(MEMORY[0x1E4F8CDF8], "apertureLibraryType", v2);
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F8CDF8] iPhotoLibraryType];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)importLibrarySourceForURL:(id)a3 exceptions:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [MEMORY[0x1E4F1CA48] array];
  id v23 = 0;
  int v8 = [a1 _isValidPhotoLibrary:v6 error:&v23];
  id v9 = v23;
  id v10 = v9;
  if (v8)
  {
    objc_super v11 = [PHImportLibrarySource alloc];
    v27[0] = v6;
    id v12 = (void *)MEMORY[0x1E4F1C978];
    id v13 = (id *)v27;
  }
  else
  {
    if ([v9 code] != 6209)
    {
      if (a4)
      {
        long long v18 = [PHImportException alloc];
        long long v19 = [v6 path];
        uint64_t v20 = [v19 lastPathComponent];
        uint64_t v21 = [(PHImportException *)v18 initWithType:7 path:v20 underlyingError:v10 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportLibrarySource.m" line:51];
        [v7 addObject:v21];

        __int16 v15 = 0;
        *a4 = (id)[v7 copy];
      }
      else
      {
        __int16 v15 = 0;
      }
      goto LABEL_12;
    }
    objc_super v11 = [PHImportLegacyLibrarySource alloc];
    id v26 = v6;
    id v12 = (void *)MEMORY[0x1E4F1C978];
    id v13 = &v26;
  }
  uint64_t v14 = [v12 arrayWithObjects:v13 count:1];
  __int16 v15 = [(PHImportLibrarySource *)v11 initWithURLs:v14];

  if (v15)
  {
    id v16 = PLImportGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = NSStringFromClass((Class)a1);
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "Attempting to import library with %@", buf, 0xCu);
    }
  }
LABEL_12:

  return v15;
}

@end