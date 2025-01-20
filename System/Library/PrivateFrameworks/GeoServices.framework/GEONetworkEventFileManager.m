@interface GEONetworkEventFileManager
+ (id)sharedManager;
- (BOOL)_createIfNeededNetworkEventDataDirectory:(id)a3;
- (GEONetworkEventFileManager)init;
- (GEONetworkEventFileManager)initWithDirectory:(id)a3;
- (id)_filepathFromDate:(id)a3;
- (int)fileDescriptorOfNetworkEventDataFileForRepresentativeDate:(id)a3;
- (void)_clearTimer;
- (void)_closeFiles;
- (void)_startTimer;
- (void)commoninit;
- (void)saveNetworkEventData:(id)a3 atTime:(id)a4;
@end

@implementation GEONetworkEventFileManager

void __58__GEONetworkEventFileManager_saveNetworkEventData_atTime___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _createIfNeededNetworkEventDataDirectory:*(void *)(*(void *)(a1 + 32) + 32)])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
    v2 = [*(id *)(a1 + 40) data];
    v3 = GEOGetNetEventFileManagerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134217984;
      uint64_t v8 = [v2 length];
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "will write netEvent data of size %llu", (uint8_t *)&v7, 0xCu);
    }

    v4 = [*(id *)(a1 + 32) _filepathFromDate:*(void *)(a1 + 48)];
    id v5 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v4];
    if (!v5)
    {
      id v5 = [[GEONetworkEventFile alloc] initForWriteWithFilePath:v4];
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:v5 forKeyedSubscript:v4];
    }
    v6 = [*(id *)(a1 + 40) data];
    [v5 writeNetworkEventData:v6];

    [*(id *)(a1 + 32) _startTimer];
  }
  else
  {
    v2 = GEOGetNetEventFileManagerLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "can't write netEvent data; missing directory",
        (uint8_t *)&v7,
        2u);
    }
  }
}

- (id)_filepathFromDate:(id)a3
{
  v4 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:a3];
  id v5 = (void *)[[NSString alloc] initWithFormat:@"%@-%@", @"neteventdata", v4];
  v6 = [(NSString *)self->_fileDirectory stringByAppendingPathComponent:v5];

  return v6;
}

- (void)_startTimer
{
  v3 = GEOGetNetEventFileManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "scheduling cleanup timer", v6, 2u);
  }

  uint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_NetEventDataFileInactivityDuration, (uint64_t)off_1E9114E58);
  dispatch_time_t v5 = dispatch_time(0, 1000000000 * UInteger);
  dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (BOOL)_createIfNeededNetworkEventDataDirectory:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_needDir
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        dispatch_time_t v5 = objc_claimAutoreleasedReturnValue(),
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
      v10 = GEOGetNetEventFileManagerLog();
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

- (void)saveNetworkEventData:(id)a3 atTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  syncQ = self->_syncQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__GEONetworkEventFileManager_saveNetworkEventData_atTime___block_invoke;
  block[3] = &unk_1E53D99F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(syncQ, block);
}

+ (id)sharedManager
{
  if (qword_1EB29F5E8 != -1) {
    dispatch_once(&qword_1EB29F5E8, &__block_literal_global_18);
  }
  v2 = (void *)_MergedGlobals_191;

  return v2;
}

void __43__GEONetworkEventFileManager_sharedManager__block_invoke()
{
  id v2 = +[GEOFilePaths pathFor:19];
  v0 = [[GEONetworkEventFileManager alloc] initWithDirectory:v2];
  v1 = (void *)_MergedGlobals_191;
  _MergedGlobals_191 = (uint64_t)v0;
}

- (void)commoninit
{
  self->_needDir = 1;
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (OS_dispatch_queue *)dispatch_queue_create("netEventData", v3);
  syncQ = self->_syncQ;
  self->_syncQ = v4;

  id v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
  dateFormatter = self->_dateFormatter;
  self->_dateFormatter = v6;

  uint64_t v8 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(NSDateFormatter *)self->_dateFormatter setLocale:v8];

  [(NSDateFormatter *)self->_dateFormatter setDateFormat:@"yyyyMMdd"];
  id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  netEventFiles = self->_netEventFiles;
  self->_netEventFiles = v9;

  v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_syncQ);
  closeTimer = self->_closeTimer;
  self->_closeTimer = v11;

  dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  id v13 = self->_closeTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __40__GEONetworkEventFileManager_commoninit__block_invoke;
  handler[3] = &unk_1E53D79D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v13, handler);
  dispatch_activate((dispatch_object_t)self->_closeTimer);
}

uint64_t __40__GEONetworkEventFileManager_commoninit__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeFiles];
}

- (GEONetworkEventFileManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)GEONetworkEventFileManager;
  id v2 = [(GEONetworkEventFileManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GEONetworkEventFileManager *)v2 commoninit];
  }
  return v3;
}

- (void)_closeFiles
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = GEOGetNetEventFileManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "cleanup timer fired", buf, 2u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_netEventFiles;
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
        id v10 = GEOGetNetEventFileManagerLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v9;
          _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "closing netEvent file '%@'", buf, 0xCu);
        }

        v11 = [(NSMutableDictionary *)self->_netEventFiles objectForKeyedSubscript:v9];
        [v11 close];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_netEventFiles removeAllObjects];
  [(GEONetworkEventFileManager *)self _clearTimer];
}

- (void)_clearTimer
{
  v3 = GEOGetNetEventFileManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "disabling cleanup timer", v4, 2u);
  }

  dispatch_source_set_timer((dispatch_source_t)self->_closeTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
}

- (int)fileDescriptorOfNetworkEventDataFileForRepresentativeDate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [(GEONetworkEventFileManager *)self _filepathFromDate:a3];
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = [(GEONetworkEventFileManager *)self _filepathFromDate:v5];

  if ([v4 isEqualToString:v6])
  {
    uint64_t v7 = GEOGetNetEventFileManagerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      long long v13 = v4;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "nothing available now; '%@' is still active",
        (uint8_t *)&v12,
        0xCu);
    }
LABEL_9:
    int v9 = -1;
    goto LABEL_10;
  }
  uint64_t v8 = [[GEONetworkEventFile alloc] initForReadWithFilePath:v4];
  if (!v8)
  {
    id v10 = GEOGetNetEventFileManagerLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      long long v13 = v4;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, "nothing available; '%@' does not exist",
        (uint8_t *)&v12,
        0xCu);
    }

    uint64_t v7 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = v8;
  int v9 = [v8 unlinkAndReturnOpenFileDescriptor];
LABEL_10:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netEventFiles, 0);
  objc_storeStrong((id *)&self->_fileDirectory, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_closeTimer, 0);

  objc_storeStrong((id *)&self->_syncQ, 0);
}

- (GEONetworkEventFileManager)initWithDirectory:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEONetworkEventFileManager;
  uint64_t v5 = [(GEONetworkEventFileManager *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(GEONetworkEventFileManager *)v5 commoninit];
    uint64_t v7 = [v4 copy];
    fileDirectory = v6->_fileDirectory;
    v6->_fileDirectory = (NSString *)v7;

    if ([(GEONetworkEventFileManager *)v6 _createIfNeededNetworkEventDataDirectory:v4])
    {
      v6->_needDir = 0;
    }
  }

  return v6;
}

@end