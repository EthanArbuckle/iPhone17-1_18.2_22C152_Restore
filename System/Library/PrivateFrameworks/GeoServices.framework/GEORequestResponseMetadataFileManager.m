@interface GEORequestResponseMetadataFileManager
+ (id)sharedManager;
- (BOOL)_createIfNeededRequestResponseMetadataDirectory:(id)a3;
- (GEORequestResponseMetadataFileManager)init;
- (GEORequestResponseMetadataFileManager)initWithDirectory:(id)a3;
- (id)_filepathFromBatchID:(unint64_t)a3;
- (int)fileDescriptorOfRequestResponseMetadataFileForBatchID:(unint64_t)a3;
- (void)_clearTimer;
- (void)_closeFiles;
- (void)_startTimer;
- (void)commoninit;
- (void)saveRequestResponseMetadata:(id)a3 batchID:(unint64_t)a4;
@end

@implementation GEORequestResponseMetadataFileManager

+ (id)sharedManager
{
  if (qword_1EB29F9A0 != -1) {
    dispatch_once(&qword_1EB29F9A0, &__block_literal_global_67);
  }
  v2 = (void *)_MergedGlobals_226;

  return v2;
}

void __54__GEORequestResponseMetadataFileManager_sharedManager__block_invoke()
{
  id v2 = +[GEOFilePaths pathFor:21];
  v0 = [[GEORequestResponseMetadataFileManager alloc] initWithDirectory:v2];
  v1 = (void *)_MergedGlobals_226;
  _MergedGlobals_226 = (uint64_t)v0;
}

- (void)commoninit
{
  self->_needDir = 1;
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (OS_dispatch_queue *)dispatch_queue_create("reqRespMetadata", v3);
  syncQ = self->_syncQ;
  self->_syncQ = v4;

  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  metadataFiles = self->_metadataFiles;
  self->_metadataFiles = v6;

  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_syncQ);
  closeTimer = self->_closeTimer;
  self->_closeTimer = v8;

  dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  v10 = self->_closeTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __51__GEORequestResponseMetadataFileManager_commoninit__block_invoke;
  handler[3] = &unk_1E53D79D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  dispatch_activate((dispatch_object_t)self->_closeTimer);
}

uint64_t __51__GEORequestResponseMetadataFileManager_commoninit__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeFiles];
}

- (GEORequestResponseMetadataFileManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)GEORequestResponseMetadataFileManager;
  id v2 = [(GEORequestResponseMetadataFileManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GEORequestResponseMetadataFileManager *)v2 commoninit];
  }
  return v3;
}

- (void)_closeFiles
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = GEOGetRRMetadataFileManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "cleanup timer fired", buf, 2u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_metadataFiles;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v10 = GEOGetRRMetadataFileManagerLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v9;
          _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "closing service metadata file '%@'", buf, 0xCu);
        }

        v11 = [(NSMutableDictionary *)self->_metadataFiles objectForKeyedSubscript:v9];
        [v11 close];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_metadataFiles removeAllObjects];
  [(GEORequestResponseMetadataFileManager *)self _clearTimer];
}

- (void)_startTimer
{
  v3 = GEOGetRRMetadataFileManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "scheduling cleanup timer", v6, 2u);
  }

  uint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_RequestResponseMetadataFileInactivityDuration, (uint64_t)off_1E9114E68);
  dispatch_time_t v5 = dispatch_time(0, 1000000000 * UInteger);
  dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)_clearTimer
{
  v3 = GEOGetRRMetadataFileManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "disabling cleanup timer", v4, 2u);
  }

  dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
}

- (id)_filepathFromBatchID:(unint64_t)a3
{
  v4 = (void *)[[NSString alloc] initWithFormat:@"%@-%llu", @"rrmetadata", a3];
  dispatch_time_t v5 = [(NSString *)self->_fileDirectory stringByAppendingPathComponent:v4];

  return v5;
}

- (void)saveRequestResponseMetadata:(id)a3 batchID:(unint64_t)a4
{
  id v6 = a3;
  syncQ = self->_syncQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__GEORequestResponseMetadataFileManager_saveRequestResponseMetadata_batchID___block_invoke;
  block[3] = &unk_1E53D9680;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(syncQ, block);
}

void __77__GEORequestResponseMetadataFileManager_saveRequestResponseMetadata_batchID___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _createIfNeededRequestResponseMetadataDirectory:*(void *)(*(void *)(a1 + 32) + 24)])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
    id v2 = [*(id *)(a1 + 40) data];
    v3 = GEOGetRRMetadataFileManagerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 134217984;
      uint64_t v7 = [v2 length];
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "will write service metadata of size %llu", (uint8_t *)&v6, 0xCu);
    }

    v4 = [*(id *)(a1 + 32) _filepathFromBatchID:*(void *)(a1 + 48)];
    id v5 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v4];
    if (!v5)
    {
      id v5 = [[GEORequestResponseMetadataFile alloc] initForWriteWithFilePath:v4];
      [*(id *)(*(void *)(a1 + 32) + 32) setObject:v5 forKeyedSubscript:v4];
    }
    [v5 writeRequestResponseMetadata:v2];
    [*(id *)(a1 + 32) _startTimer];
  }
  else
  {
    id v2 = GEOGetRRMetadataFileManagerLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "can't write service metadata; missing directory",
        (uint8_t *)&v6,
        2u);
    }
  }
}

- (int)fileDescriptorOfRequestResponseMetadataFileForBatchID:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = -[GEORequestResponseMetadataFileManager _filepathFromBatchID:](self, "_filepathFromBatchID:");
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__33;
  v22 = __Block_byref_object_dispose__33;
  int v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = [v6 UUIDString];
  id v23 = [v5 stringByAppendingFormat:@"_%@", v7];

  syncQ = self->_syncQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__GEORequestResponseMetadataFileManager_fileDescriptorOfRequestResponseMetadataFileForBatchID___block_invoke;
  block[3] = &unk_1E53D7BD8;
  block[4] = self;
  id v9 = v5;
  id v16 = v9;
  uint64_t v17 = &v18;
  dispatch_sync(syncQ, block);
  if (v19[5])
  {
    id v10 = [GEORequestResponseMetadataFile alloc];
    unint64_t v11 = [(GEORequestResponseMetadataFile *)v10 initForReadWithFilePath:v19[5]];
    long long v12 = v11;
    if (v11)
    {
      int v13 = [v11 unlinkAndReturnOpenFileDescriptor];
    }
    else
    {
      long long v12 = GEOGetRRMetadataFileManagerLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v25 = a3;
        _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_INFO, "nothing available for batchID '%llu'", buf, 0xCu);
      }
      int v13 = -1;
    }
  }
  else
  {
    int v13 = -1;
  }

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __95__GEORequestResponseMetadataFileManager_fileDescriptorOfRequestResponseMetadataFileForBatchID___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  v3 = v2;
  if (v2)
  {
    [v2 close];
    [*(id *)(a1[4] + 32) removeObjectForKey:a1[5]];
  }
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id v13 = 0;
  [v4 moveItemAtPath:v5 toPath:v6 error:&v13];
  id v7 = v13;

  if (v7)
  {
    uint64_t v8 = GEOGetRRMetadataFileManagerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = a1[5];
      uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "unable to move '%@' to '%@' (%@)", buf, 0x20u);
    }

    uint64_t v11 = *(void *)(a1[6] + 8);
    long long v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

- (BOOL)_createIfNeededRequestResponseMetadataDirectory:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_needDir
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 fileExistsAtPath:v4 isDirectory:0],
        v5,
        (v6 & 1) == 0))
  {
    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v12 = 0;
    char v7 = [v8 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v12];
    id v9 = v12;

    if ((v7 & 1) == 0)
    {
      uint64_t v10 = GEOGetRRMetadataFileManagerLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v9;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "directory create error : (%@)", buf, 0xCu);
      }
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataFiles, 0);
  objc_storeStrong((id *)&self->_fileDirectory, 0);
  objc_storeStrong((id *)&self->_closeTimer, 0);

  objc_storeStrong((id *)&self->_syncQ, 0);
}

- (GEORequestResponseMetadataFileManager)initWithDirectory:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORequestResponseMetadataFileManager;
  uint64_t v5 = [(GEORequestResponseMetadataFileManager *)&v10 init];
  char v6 = v5;
  if (v5)
  {
    [(GEORequestResponseMetadataFileManager *)v5 commoninit];
    uint64_t v7 = [v4 copy];
    fileDirectory = v6->_fileDirectory;
    v6->_fileDirectory = (NSString *)v7;

    if ([(GEORequestResponseMetadataFileManager *)v6 _createIfNeededRequestResponseMetadataDirectory:v4])
    {
      v6->_needDir = 0;
    }
  }

  return v6;
}

@end