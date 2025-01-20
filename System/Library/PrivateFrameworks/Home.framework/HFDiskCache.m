@interface HFDiskCache
- (HFDiskCache)initWithCacheDirectoryURL:(id)a3 diskCacheDelegate:(id)a4;
- (HFDiskCacheDelegate)diskCacheDelegate;
- (NSURL)directoryURL;
- (void)_createCacheEntriesFromFilesOnDisk;
- (void)cache:(id)a3 didEvictObject:(id)a4 forKey:(id)a5 cost:(unint64_t)a6;
- (void)createCacheEntriesFromFilesOnDisk;
@end

@implementation HFDiskCache

- (HFDiskCache)initWithCacheDirectoryURL:(id)a3 diskCacheDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFDiskCache;
  v9 = [(HFCache *)&v18 initWithDelegate:self];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_directoryURL, a3);
    objc_storeWeak((id *)&v10->_diskCacheDelegate, v8);
    objc_initWeak(&location, v10);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __59__HFDiskCache_initWithCacheDirectoryURL_diskCacheDelegate___block_invoke;
    v15 = &unk_26408F6A8;
    objc_copyWeak(&v16, &location);
    [(HFCache *)v10 setOverrideObjectEvictionComparator:&v12];
    [(HFDiskCache *)v10 createCacheEntriesFromFilesOnDisk];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

uint64_t __59__HFDiskCache_initWithCacheDirectoryURL_diskCacheDelegate___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v45 = a2;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  uint64_t v15 = objc_opt_class();
  id v16 = v11;
  if (!v16) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  objc_super v18 = v16;
  if (!v17)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    v20 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v19 handleFailureInFunction:v20, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v15, objc_opt_class() file lineNumber description];

LABEL_7:
    objc_super v18 = 0;
  }

  uint64_t v21 = objc_opt_class();
  id v22 = v13;
  if (!v22)
  {
LABEL_14:
    v24 = 0;
    goto LABEL_15;
  }
  if (objc_opt_isKindOfClass()) {
    v23 = v22;
  }
  else {
    v23 = 0;
  }
  v24 = v22;
  if (!v23)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    v26 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v25 handleFailureInFunction:v26, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v21, objc_opt_class() file lineNumber description];

    goto LABEL_14;
  }
LABEL_15:

  id v50 = 0;
  uint64_t v27 = *MEMORY[0x263EFF5E8];
  id v49 = 0;
  v46 = v18;
  char v28 = [v18 getResourceValue:&v50 forKey:v27 error:&v49];
  id v29 = v50;
  id v30 = v49;
  if (v28)
  {
    id v47 = 0;
    id v48 = 0;
    char v31 = [v24 getResourceValue:&v48 forKey:v27 error:&v47];
    v32 = (uint64_t (**)(id, id, id, uint64_t, id, id, uint64_t))v48;
    id v33 = v47;

    if (v31)
    {
      uint64_t v34 = [v29 compare:v32];
      id v30 = v33;
      v35 = v45;
    }
    else
    {
      id v42 = v29;
      v37 = HFLogForCategory(0xDuLL);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v52 = "-[HFDiskCache initWithCacheDirectoryURL:diskCacheDelegate:]_block_invoke";
        __int16 v53 = 2112;
        id v54 = v33;
        __int16 v55 = 2112;
        v56 = v24;
        _os_log_error_impl(&dword_20B986000, v37, OS_LOG_TYPE_ERROR, "%s error: %@; %@", buf, 0x20u);
      }

      v38 = [WeakRetained defaultObjectEvictionComparator];
      v39 = v24;
      id v40 = v33;
      v35 = v45;
      uint64_t v34 = ((uint64_t (**)(void, id, id, uint64_t, id, id, uint64_t))v38)[2](v38, v45, v16, a4, v12, v22, a7);

      id v30 = v40;
      v24 = v39;
      id v29 = v42;
    }
  }
  else
  {
    v36 = HFLogForCategory(0xDuLL);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v52 = "-[HFDiskCache initWithCacheDirectoryURL:diskCacheDelegate:]_block_invoke";
      __int16 v53 = 2112;
      id v54 = v30;
      __int16 v55 = 2112;
      v56 = v46;
      _os_log_error_impl(&dword_20B986000, v36, OS_LOG_TYPE_ERROR, "%s error: %@; %@", buf, 0x20u);
    }

    v32 = [WeakRetained defaultObjectEvictionComparator];
    v35 = v45;
    uint64_t v34 = v32[2](v32, v45, v16, a4, v12, v22, a7);
  }

  return v34;
}

- (void)createCacheEntriesFromFilesOnDisk
{
  v3 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  v4 = [(HFCache *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HFDiskCache_createCacheEntriesFromFilesOnDisk__block_invoke;
  block[3] = &unk_26408DDE0;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __48__HFDiskCache_createCacheEntriesFromFilesOnDisk__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createCacheEntriesFromFilesOnDisk];
}

- (void)_createCacheEntriesFromFilesOnDisk
{
  v11[1] = *MEMORY[0x263EF8340];
  v3 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = [(HFDiskCache *)self directoryURL];
  [v4 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:0];

  v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [(HFDiskCache *)self directoryURL];
  v11[0] = *MEMORY[0x263EFF688];
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v9 = [v6 enumeratorAtURL:v7 includingPropertiesForKeys:v8 options:20 errorHandler:&__block_literal_global_32];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__HFDiskCache__createCacheEntriesFromFilesOnDisk__block_invoke_5;
  v10[3] = &unk_26408F6D0;
  v10[4] = self;
  objc_msgSend(v9, "na_each:", v10);
}

uint64_t __49__HFDiskCache__createCacheEntriesFromFilesOnDisk__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  v6 = HFLogForCategory(0xDuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v8 = [v4 path];
    int v9 = 136315650;
    v10 = "-[HFDiskCache _createCacheEntriesFromFilesOnDisk]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "%s error: %@; %@", (uint8_t *)&v9, 0x20u);
  }
  return 1;
}

void __49__HFDiskCache__createCacheEntriesFromFilesOnDisk__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) diskCacheDelegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0
    && ([*(id *)(a1 + 32) diskCacheDelegate],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 diskCache:*(void *)(a1 + 32) shouldAddExistingFileToCache:v3],
        v6,
        (v7 & 1) == 0))
  {
    __int16 v13 = HFLogForCategory(0xDuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v18 = [v3 path];
      *(_DWORD *)buf = 136315394;
      v23 = "-[HFDiskCache _createCacheEntriesFromFilesOnDisk]_block_invoke";
      __int16 v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "%s delegate declined to add existing file to cache: %@", buf, 0x16u);
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) diskCacheDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [*(id *)(a1 + 32) diskCacheDelegate];
      uint64_t v11 = [v10 diskCache:*(void *)(a1 + 32) uniqueIdentifierForExistingFile:v3];
    }
    else
    {
      id v12 = [v3 lastPathComponent];
      v10 = [v12 stringByDeletingPathExtension];

      uint64_t v11 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v10];
    }
    __int16 v13 = v11;

    if (v13)
    {
      id v21 = 0;
      v14 = (void *)*MEMORY[0x263EFF688];
      id v20 = 0;
      char v15 = [v3 getResourceValue:&v21 forKey:v14 error:&v20];
      id v16 = v21;
      id v17 = v20;
      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 32), "_setObject:forKey:cost:removeObjectsToAccommodateCost:", v3, v13, objc_msgSend(v16, "unsignedIntegerValue"), 0);
      }
      else
      {
        v19 = HFLogForCategory(0xDuLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v23 = "-[HFDiskCache _createCacheEntriesFromFilesOnDisk]_block_invoke";
          __int16 v24 = 2112;
          v25 = v14;
          __int16 v26 = 2112;
          id v27 = v17;
          _os_log_error_impl(&dword_20B986000, v19, OS_LOG_TYPE_ERROR, "%s %@ error: %@", buf, 0x20u);
        }
      }
    }
  }
}

- (void)cache:(id)a3 didEvictObject:(id)a4 forKey:(id)a5 cost:(unint64_t)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = objc_opt_class();
  id v13 = v9;
  if (!v13) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  char v15 = v13;
  if (!v14)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    id v17 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v16 handleFailureInFunction:v17, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v12, objc_opt_class() file lineNumber description];

LABEL_7:
    char v15 = 0;
  }

  objc_super v18 = [MEMORY[0x263F08850] defaultManager];
  id v34 = 0;
  int v19 = [v18 removeItemAtURL:v15 error:&v34];
  id v20 = v34;

  id v21 = HFLogForCategory(0xDuLL);
  id v22 = v21;
  if (!v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v33 = [v15 relativePath];
      *(_DWORD *)buf = 136315650;
      v36 = "-[HFDiskCache cache:didEvictObject:forKey:cost:]";
      __int16 v37 = 2112;
      id v38 = v20;
      __int16 v39 = 2112;
      id v40 = v33;
      _os_log_error_impl(&dword_20B986000, v22, OS_LOG_TYPE_ERROR, "%s could not remove file at %@: %@", buf, 0x20u);
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [v15 relativePath];
    __int16 v24 = [NSNumber numberWithUnsignedInteger:a6];
    *(_DWORD *)buf = 136315650;
    v36 = "-[HFDiskCache cache:didEvictObject:forKey:cost:]";
    __int16 v37 = 2112;
    id v38 = v23;
    __int16 v39 = 2112;
    id v40 = v24;
    _os_log_impl(&dword_20B986000, v22, OS_LOG_TYPE_DEFAULT, "%s removed file at %@; size: %@", buf, 0x20u);
  }
  v25 = [(HFDiskCache *)self diskCacheDelegate];
  char v26 = objc_opt_respondsToSelector();

  if (v26)
  {
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = v10;
    if (v28)
    {
      if (objc_opt_isKindOfClass()) {
        id v29 = v28;
      }
      else {
        id v29 = 0;
      }
      id v22 = v28;
      if (v29) {
        goto LABEL_19;
      }
      id v30 = [MEMORY[0x263F08690] currentHandler];
      char v31 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v30 handleFailureInFunction:v31, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v27, objc_opt_class() file lineNumber description];
    }
    id v22 = 0;
LABEL_19:

    v32 = [(HFDiskCache *)self diskCacheDelegate];
    [v32 diskCache:self didEvictFileFromDisk:v15 forUniqueIdentifier:v22];

LABEL_22:
  }
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (HFDiskCacheDelegate)diskCacheDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diskCacheDelegate);
  return (HFDiskCacheDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_diskCacheDelegate);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end