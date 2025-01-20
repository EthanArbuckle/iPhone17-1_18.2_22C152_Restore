@interface BRKDataCollectionBundle
+ (id)defaultLogDirectory;
- (BOOL)isPackaged;
- (BOOL)packageBundleToPath:(id *)a3 filePrioritization:(id)a4;
- (BOOL)removeBundle;
- (BRKDataCollectionBundle)initWithFolderNamed:(id)a3;
- (NSArray)addedFiles;
- (NSString)basePath;
- (NSString)folderName;
- (id)_writerForClass:(Class)a3 file:(id)a4 configuration:(id)a5;
- (id)accelerationWriterForFile:(id)a3;
- (id)accelerationWriterForFile:(id)a3 valueCount:(unint64_t)a4;
- (id)audioWriterForFile:(id)a3;
- (id)logWriterForFile:(id)a3;
- (void)_writeData:(id)a3 toFile:(id)a4 updateManifest:(BOOL)a5;
- (void)closeWriterForFile:(id)a3;
- (void)removeBundle;
- (void)writeData:(id)a3 toFile:(id)a4;
- (void)writeJSON:(id)a3 toFile:(id)a4;
@end

@implementation BRKDataCollectionBundle

+ (id)defaultLogDirectory
{
  if (defaultLogDirectory_onceToken != -1) {
    dispatch_once(&defaultLogDirectory_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)defaultLogDirectory_LogDirectory;
  return v2;
}

void __46__BRKDataCollectionBundle_defaultLogDirectory__block_invoke()
{
  NSHomeDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"Library/Logs/Brook"];
  v1 = (void *)defaultLogDirectory_LogDirectory;
  defaultLogDirectory_LogDirectory = v0;
}

- (BRKDataCollectionBundle)initWithFolderNamed:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BRKDataCollectionBundle;
  v6 = [(BRKDataCollectionBundle *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_folderName, a3);
    v8 = [(id)objc_opt_class() defaultLogDirectory];
    uint64_t v9 = [v8 stringByAppendingPathComponent:v5];
    basePath = v7->_basePath;
    v7->_basePath = (NSString *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    writers = v7->_writers;
    v7->_writers = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9C0] set];
    manifest = v7->_manifest;
    v7->_manifest = (NSMutableSet *)v13;

    v7->_writersLock._os_unfair_lock_opaque = 0;
    uint64_t v15 = [MEMORY[0x263F2BBE8] settingsForActiveDevice];
    settings = v7->_settings;
    v7->_settings = (BRKSettings *)v15;
  }
  return v7;
}

- (NSArray)addedFiles
{
  return (NSArray *)[(NSMutableSet *)self->_manifest allObjects];
}

- (void)writeJSON:(id)a3 toFile:(id)a4
{
  v6 = (void *)MEMORY[0x263F08900];
  uint64_t v9 = 0;
  id v7 = a4;
  v8 = [v6 dataWithJSONObject:a3 options:4 error:&v9];
  [(BRKDataCollectionBundle *)self writeData:v8 toFile:v7];
}

- (void)writeData:(id)a3 toFile:(id)a4
{
}

- (void)_writeData:(id)a3 toFile:(id)a4 updateManifest:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8 && [(BRKSettings *)self->_settings isDataCollectionEnabled])
  {
    if (v5) {
      [(NSMutableSet *)self->_manifest addObject:v9];
    }
    v10 = [(NSString *)self->_basePath stringByAppendingPathComponent:v9];
    uint64_t v11 = [v10 stringByDeletingLastPathComponent];
    BRKCreateDirectory();

    if (([v8 writeToFile:v10 atomically:1] & 1) == 0)
    {
      v12 = BRKLoggingObjectForDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[BRKDataCollectionBundle _writeData:toFile:updateManifest:]((uint64_t)v10, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
}

- (id)accelerationWriterForFile:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BRKDataCollectionBundle *)self _writerForClass:objc_opt_class() file:v4 configuration:0];

  return v5;
}

- (id)accelerationWriterForFile:(id)a3 valueCount:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__BRKDataCollectionBundle_accelerationWriterForFile_valueCount___block_invoke;
  v10[3] = &__block_descriptor_40_e19_v16__0__BRKWriter_8l;
  v10[4] = a4;
  id v8 = [(BRKDataCollectionBundle *)self _writerForClass:v7 file:v6 configuration:v10];

  return v8;
}

uint64_t __64__BRKDataCollectionBundle_accelerationWriterForFile_valueCount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 openWithDataCount:*(void *)(a1 + 32)];
}

- (id)audioWriterForFile:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BRKDataCollectionBundle *)self _writerForClass:objc_opt_class() file:v4 configuration:0];

  return v5;
}

- (id)logWriterForFile:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BRKDataCollectionBundle *)self _writerForClass:objc_opt_class() file:v4 configuration:0];

  return v5;
}

- (id)_writerForClass:(Class)a3 file:(id)a4 configuration:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  os_unfair_lock_lock(&self->_writersLock);
  id v10 = [(NSMutableDictionary *)self->_writers objectForKeyedSubscript:v8];
  os_unfair_lock_unlock(&self->_writersLock);
  if (v10)
  {
    if (objc_opt_isKindOfClass())
    {
      id v10 = v10;
      uint64_t v11 = v10;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (![(BRKSettings *)self->_settings isDataCollectionEnabled])
  {
    id v10 = 0;
LABEL_9:
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  v12 = [(NSString *)self->_basePath stringByAppendingPathComponent:v8];
  uint64_t v13 = [v12 stringByDeletingLastPathComponent];
  BRKCreateDirectory();

  [(NSMutableSet *)self->_manifest addObject:v8];
  uint64_t v14 = (void *)[[a3 alloc] initWithPath:v12];
  if (v9) {
    v9[2](v9, v14);
  }
  os_unfair_lock_lock(&self->_writersLock);
  [(NSMutableDictionary *)self->_writers setObject:v14 forKeyedSubscript:v8];
  os_unfair_lock_unlock(&self->_writersLock);
  id v10 = v14;

  uint64_t v11 = v10;
LABEL_10:

  return v11;
}

- (void)closeWriterForFile:(id)a3
{
  p_writersLock = &self->_writersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_writersLock);
  id v6 = [(NSMutableDictionary *)self->_writers objectForKeyedSubscript:v5];
  [(NSMutableDictionary *)self->_writers setObject:0 forKeyedSubscript:v5];

  os_unfair_lock_unlock(p_writersLock);
  if (objc_opt_respondsToSelector()) {
    [v6 performSelector:sel_close];
  }
}

- (BOOL)packageBundleToPath:(id *)a3 filePrioritization:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (![(BRKSettings *)self->_settings isDataCollectionEnabled])
  {
    BOOL v32 = 0;
    goto LABEL_31;
  }
  v43 = a3;
  os_unfair_lock_lock(&self->_writersLock);
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_writers copy];
  os_unfair_lock_unlock(&self->_writersLock);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v8);
        }
        -[BRKDataCollectionBundle closeWriterForFile:](self, "closeWriterForFile:", *(void *)(*((void *)&v49 + 1) + 8 * i), v43);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v10);
  }

  id v44 = v6;
  uint64_t v13 = (void *)[v6 mutableCopy];
  for (j = 0; ; j = v46)
  {
    uint64_t v15 = [(NSMutableSet *)self->_manifest allObjects];
    id v16 = [v15 componentsJoinedByString:@"\n"];

    uint64_t v17 = [v16 dataUsingEncoding:4];
    [(BRKDataCollectionBundle *)self _writeData:v17 toFile:@"manifest" updateManifest:0];
    uint64_t v18 = (void *)MEMORY[0x263F3A070];
    v19 = [NSURL fileURLWithPath:self->_basePath];
    v20 = [v18 archiveDirectoryAt:v19 deleteOriginal:0];

    if (!v20)
    {
      v23 = BRKLoggingObjectForDomain();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[BRKDataCollectionBundle packageBundleToPath:filePrioritization:](v23);
      }
LABEL_25:

      BOOL v32 = 0;
LABEL_26:
      id v6 = v44;
      goto LABEL_30;
    }
    if (BRKFileSize() < 1900001) {
      break;
    }
    v21 = [MEMORY[0x263F08850] defaultManager];
    id v48 = 0;
    char v22 = [v21 removeItemAtURL:v20 error:&v48];
    v23 = v48;

    if ((v22 & 1) == 0)
    {
      v34 = BRKLoggingObjectForDomain();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[BRKDataCollectionBundle packageBundleToPath:filePrioritization:]((uint64_t)v23, v34, v35, v36, v37, v38, v39, v40);
      }

      goto LABEL_25;
    }
    if (![v13 count]) {
      goto LABEL_25;
    }
    v24 = v13;
    v25 = v17;
    v45 = v16;
    v46 = v20;
    v26 = [v24 lastObject];
    v27 = v24;
    [v24 removeLastObject];
    v28 = [(NSString *)self->_basePath stringByAppendingPathComponent:v26];
    v29 = [MEMORY[0x263F08850] defaultManager];
    v47 = v23;
    char v30 = [v29 removeItemAtPath:v28 error:&v47];
    v31 = v47;

    if ((v30 & 1) == 0)
    {
      v41 = BRKLoggingObjectForDomain();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[BRKDataCollectionBundle packageBundleToPath:filePrioritization:]((uint64_t)v26, (uint64_t)v31, v41);
      }

      BOOL v32 = 0;
      id v6 = v44;
      id v16 = v45;
      uint64_t v13 = v27;
      v20 = v46;
      goto LABEL_30;
    }
    [(NSMutableSet *)self->_manifest removeObject:v26];

    uint64_t v13 = v27;
  }

  BRKMarkFilePurgeable();
  id v16 = [v20 path];
  uint64_t v33 = [v16 length];
  BOOL v32 = v33 != 0;
  if (!v33) {
    goto LABEL_26;
  }
  BOOL v32 = 1;
  self->_isPackaged = 1;
  id v6 = v44;
  if (v43)
  {
    id v16 = v16;
    id *v43 = v16;
  }
LABEL_30:

LABEL_31:
  return v32;
}

- (BOOL)removeBundle
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  basePath = self->_basePath;
  p_basePath = &self->_basePath;
  id v16 = 0;
  char v6 = [v3 removeItemAtPath:basePath error:&v16];
  id v7 = v16;

  if ((v6 & 1) == 0)
  {
    id v8 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(BRKDataCollectionBundle *)(uint64_t)p_basePath removeBundle];
    }
  }
  return v6;
}

- (NSString)folderName
{
  return self->_folderName;
}

- (NSString)basePath
{
  return self->_basePath;
}

- (BOOL)isPackaged
{
  return self->_isPackaged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_folderName, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_writers, 0);
}

- (void)_writeData:(uint64_t)a3 toFile:(uint64_t)a4 updateManifest:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)packageBundleToPath:(os_log_t)log filePrioritization:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_234680000, log, OS_LOG_TYPE_ERROR, "Unable to archive package", v1, 2u);
}

- (void)packageBundleToPath:(os_log_t)log filePrioritization:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_234680000, log, OS_LOG_TYPE_ERROR, "Unable to remove file %@ for resize %@", (uint8_t *)&v3, 0x16u);
}

- (void)packageBundleToPath:(uint64_t)a3 filePrioritization:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeBundle
{
}

@end