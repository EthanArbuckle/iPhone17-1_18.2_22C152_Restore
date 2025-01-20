@interface _MKIconDiskCache
- (_MKIconDiskCache)initWithDirectoryURL:(id)a3;
- (id)imageForStyleAttributes:(id)a3 size:(unint64_t)a4 scale:(double)a5 drawingBlock:(id)a6;
- (id)imageForStyleAttributes:(id)a3 size:(unint64_t)a4 scale:(double)a5 isCarplay:(BOOL)a6 isTransit:(BOOL)a7 isTransparent:(BOOL)a8 isNightMode:(BOOL)a9 drawingBlock:(id)a10;
- (void)_updateVersionsInfo;
- (void)dealloc;
@end

@implementation _MKIconDiskCache

- (id)imageForStyleAttributes:(id)a3 size:(unint64_t)a4 scale:(double)a5 isCarplay:(BOOL)a6 isTransit:(BOOL)a7 isTransparent:(BOOL)a8 isNightMode:(BOOL)a9 drawingBlock:(id)a10
{
  BOOL v10 = a9;
  BOOL v11 = a8;
  BOOL v12 = a7;
  BOOL v13 = a6;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  v18 = (void (**)(void))a10;
  v19 = v18;
  v20 = 0;
  v39 = v17;
  if (v17 && v18)
  {
    v37 = v18;
    v38 = [MEMORY[0x1E4F29128] UUID];
    [(NSLock *)self->_lock lock];
    [(NSMutableArray *)self->_inProgressUUIDs addObject:v38];
    [(NSLock *)self->_lock unlock];
    id v36 = v17;
    v21 = _pairStringsForStyleAttributes([v36 featureStyleAttributes]);
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"self" ascending:1];
    *(void *)buf = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
    v24 = [v21 sortedArrayUsingDescriptors:v23];

    v25 = [v24 componentsJoinedByString:@"-"];
    v26 = (void *)[v25 mutableCopy];

    if (a4 < 6) {
      [v26 appendString:off_1E54BA810[a4]];
    }
    if (v13) {
      [v26 appendString:@"-carplay"];
    }
    if (v12) {
      [v26 appendString:@"-transit"];
    }
    if (v11) {
      [v26 appendString:@"-t"];
    }
    if (v10) {
      [v26 appendString:@"-n"];
    }
    if (a5 > 1.0) {
      objc_msgSend(v26, "appendFormat:", @"@%lux", vcvtpd_u64_f64(a5));
    }
    [v26 appendString:@".png"];

    v27 = [(NSURL *)self->_directoryURL URLByAppendingPathComponent:v26];
    v28 = [v27 path];
    v29 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v30 = [v29 fileExistsAtPath:v28];

    if (v30
      && ([MEMORY[0x1E4F42A80] imageWithContentsOfFile:v28],
          (v20 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v31 = GEOGetMKIconManagerLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v28;
        _os_log_impl(&dword_18BAEC000, v31, OS_LOG_TYPE_DEBUG, "Get image at %@", buf, 0xCu);
      }

      [(NSLock *)self->_lock lock];
      [(NSMutableArray *)self->_inProgressUUIDs removeObject:v38];
      [(NSLock *)self->_lock unlock];
    }
    else
    {
      v20 = v37[2]();
      if (v20)
      {
        storingQueue = self->_storingQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __114___MKIconDiskCache_imageForStyleAttributes_size_scale_isCarplay_isTransit_isTransparent_isNightMode_drawingBlock___block_invoke;
        block[3] = &unk_1E54BA7F0;
        block[4] = self;
        id v41 = v38;
        id v33 = v20;
        id v42 = v33;
        id v43 = v28;
        dispatch_async(storingQueue, block);
        id v34 = v33;
      }
    }

    v19 = v37;
  }

  return v20;
}

- (_MKIconDiskCache)initWithDirectoryURL:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_MKIconDiskCache;
  v6 = [(_MKIconDiskCache *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_directoryURL, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v7->_lock;
    v7->_lock = v8;

    BOOL v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    inProgressUUIDs = v7->_inProgressUUIDs;
    v7->_inProgressUUIDs = v10;

    BOOL v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.Maps.MKIconDiskCache", v13);
    storingQueue = v7->_storingQueue;
    v7->_storingQueue = (OS_dispatch_queue *)v14;

    v16 = [MEMORY[0x1E4F64918] modernManager];
    [v16 addTileGroupObserver:v7 queue:v7->_storingQueue];

    [(_MKIconDiskCache *)v7 _updateVersionsInfo];
    id v17 = v7;
  }
  return v7;
}

- (void)_updateVersionsInfo
{
  v29[1] = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  v3 = [(NSURL *)self->_directoryURL URLByAppendingPathComponent:@"version.plist"];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3 error:0];
  id v5 = [MEMORY[0x1E4F64918] modernManager];
  v6 = [v5 allResourcePaths];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"self" ascending:1];
  v29[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v9 = [v6 sortedArrayUsingDescriptors:v8];

  BOOL v10 = [MEMORY[0x1E4F1CA60] dictionary];
  [v10 setObject:v9 forKeyedSubscript:@"ResourceVersions"];
  if (([v10 isEqualToDictionary:v4] & 1) == 0)
  {
    BOOL v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v12 = [(NSURL *)self->_directoryURL path];
    int v13 = [v11 fileExistsAtPath:v12];

    if (v13)
    {
      dispatch_queue_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      directoryURL = self->_directoryURL;
      id v26 = 0;
      char v16 = [v14 removeItemAtURL:directoryURL error:&v26];
      id v17 = v26;

      if ((v16 & 1) == 0)
      {
        v18 = GEOGetMKIconManagerLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v17;
          _os_log_impl(&dword_18BAEC000, v18, OS_LOG_TYPE_ERROR, "Failed to remove stale Maps images: %@", buf, 0xCu);
        }
      }
    }
    [(NSMutableArray *)self->_inProgressUUIDs removeAllObjects];
    objc_super v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    v20 = self->_directoryURL;
    id v25 = 0;
    char v21 = [v19 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:&v25];
    id v22 = v25;

    if ((v21 & 1) == 0)
    {
      v23 = GEOGetMKIconManagerLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v22;
        _os_log_impl(&dword_18BAEC000, v23, OS_LOG_TYPE_ERROR, "Failed to create Maps image cache directory: %@", buf, 0xCu);
      }
    }
    if (([v10 writeToURL:v3 atomically:1] & 1) == 0)
    {
      v24 = GEOGetMKIconManagerLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v3;
        _os_log_impl(&dword_18BAEC000, v24, OS_LOG_TYPE_ERROR, "Failed to write Maps image cache version plist to %@", buf, 0xCu);
      }
    }
  }
  [(NSLock *)self->_lock unlock];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F64918] modernManager];
  [v3 removeTileGroupObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_MKIconDiskCache;
  [(_MKIconDiskCache *)&v4 dealloc];
}

- (id)imageForStyleAttributes:(id)a3 size:(unint64_t)a4 scale:(double)a5 drawingBlock:(id)a6
{
  v6 = [(_MKIconDiskCache *)self imageForStyleAttributes:a3 size:a4 scale:0 isCarplay:0 isTransit:0 isTransparent:0 isNightMode:a5 drawingBlock:a6];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProgressUUIDs, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_storingQueue, 0);

  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end