@interface HTHangsDataFinder
+ (id)groupEntriesByHangID:(id)a3;
- (HTHangsDataFinder)initWithLogUpdateCallback:(id)a3 tailspinSavedCallback:(id)a4;
- (NSMutableArray)folderWatchDispatchSrcs;
- (NSMutableDictionary)logCountByPath;
- (NSPredicate)hangLogPredicate;
- (OS_dispatch_queue)folderWatchTaskQueue;
- (id)appRecordWithBundleId:(id)a3 cachedAppRecords:(id)a4;
- (id)dateFromString:(id)a3;
- (id)getFilteredLogURLsForPath:(id)a3 error:(id *)a4;
- (id)hangsDataEntryAtPath:(id)a3 error:(id *)a4;
- (id)hangsDataEntryWithFullPath:(id)a3 extendedAttributes:(id)a4 cachedAppRecords:(id)a5;
- (id)logUpdateCallback;
- (id)tailspinSavedCallback;
- (void)dealloc;
- (void)findEventsFilteringDeveloperApps:(BOOL)a3 completionHandler:(id)a4;
- (void)findProcessingEventsFilteringDeveloperApps:(BOOL)a3 completionHandler:(id)a4;
- (void)hangReporterDidSaveTailspin:(id)a3;
- (void)setFolderWatchDispatchSrcs:(id)a3;
- (void)setFolderWatchTaskQueue:(id)a3;
- (void)setHangLogPredicate:(id)a3;
- (void)setLogCountByPath:(id)a3;
- (void)setLogUpdateCallback:(id)a3;
- (void)setTailspinSavedCallback:(id)a3;
@end

@implementation HTHangsDataFinder

- (HTHangsDataFinder)initWithLogUpdateCallback:(id)a3 tailspinSavedCallback:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v30 = a4;
  v43.receiver = self;
  v43.super_class = (Class)HTHangsDataFinder;
  id v6 = [(HTHangsDataFinder *)&v43 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"lastPathComponent BEGINSWITH[cd] 'UIKit-runloop' OR lastPathComponent BEGINSWITH[cd] 'Fence'"];
    v8 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v7;

    if (v31)
    {
      uint64_t v9 = MEMORY[0x253383B00](v31);
      v10 = (void *)*((void *)v6 + 3);
      *((void *)v6 + 3) = v9;

      dispatch_queue_t v11 = dispatch_queue_create("com.apple.DeveloperSettings.HangDetectionFileWatcher", 0);
      v12 = (void *)*((void *)v6 + 6);
      *((void *)v6 + 6) = v11;

      id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
      v14 = (void *)*((void *)v6 + 5);
      *((void *)v6 + 5) = v13;

      uint64_t v15 = objc_opt_new();
      v16 = (void *)*((void *)v6 + 7);
      *((void *)v6 + 7) = v15;

      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x3042000000;
      v41[3] = __Block_byref_object_copy__0;
      v41[4] = __Block_byref_object_dispose__0;
      objc_initWeak(&v42, v6);
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      getDataTypePaths();
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v38 != v18) {
              objc_enumerationMutation(obj);
            }
            v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            v21 = *((void *)v6 + 6);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __69__HTHangsDataFinder_initWithLogUpdateCallback_tailspinSavedCallback___block_invoke;
            block[3] = &unk_265353F60;
            block[4] = v20;
            block[5] = v41;
            dispatch_async(v21, block);
            id v22 = v20;
            int v23 = open((const char *)[v22 UTF8String], 0x8000);
            int v24 = v23;
            if (v23 != -1)
            {
              v25 = dispatch_source_create(MEMORY[0x263EF8410], v23, 2uLL, *((dispatch_queue_t *)v6 + 6));
              handler[0] = MEMORY[0x263EF8330];
              handler[1] = 3221225472;
              handler[2] = __69__HTHangsDataFinder_initWithLogUpdateCallback_tailspinSavedCallback___block_invoke_2;
              handler[3] = &unk_265353F60;
              handler[4] = v22;
              handler[5] = v41;
              dispatch_source_set_event_handler(v25, handler);
              v33[0] = MEMORY[0x263EF8330];
              v33[1] = 3221225472;
              v33[2] = __69__HTHangsDataFinder_initWithLogUpdateCallback_tailspinSavedCallback___block_invoke_3;
              v33[3] = &__block_descriptor_36_e5_v8__0l;
              int v34 = v24;
              dispatch_source_set_cancel_handler(v25, v33);
              dispatch_resume(v25);
              [*((id *)v6 + 5) addObject:v25];
            }
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
        }
        while (v17);
      }

      _Block_object_dispose(v41, 8);
      objc_destroyWeak(&v42);
    }
    if (v30)
    {
      uint64_t v26 = MEMORY[0x253383B00](v30);
      v27 = (void *)*((void *)v6 + 4);
      *((void *)v6 + 4) = v26;

      v28 = [MEMORY[0x263F087C8] defaultCenter];
      [v28 addObserver:v6 selector:sel_hangReporterDidSaveTailspin_ name:*MEMORY[0x263F427B0] object:0];
    }
  }

  return (HTHangsDataFinder *)v6;
}

void __69__HTHangsDataFinder_initWithLogUpdateCallback_tailspinSavedCallback___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v10 = 0;
    v5 = [WeakRetained getFilteredLogURLsForPath:v4 error:&v10];
    id v6 = v10;
    uint64_t v7 = [v5 count];

    if (v6)
    {
      NSLog(&cfstr_ErrorLookingFo.isa, *(void *)(a1 + 32), v6);
    }
    else
    {
      v8 = [NSNumber numberWithUnsignedLong:v7];
      uint64_t v9 = [v3 logCountByPath];
      [v9 setObject:v8 forKeyedSubscript:*(void *)(a1 + 32)];
    }
  }
}

void __69__HTHangsDataFinder_initWithLogUpdateCallback_tailspinSavedCallback___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v14 = 0;
    v5 = [WeakRetained getFilteredLogURLsForPath:v4 error:&v14];
    id v6 = v14;
    uint64_t v7 = [v5 count];

    if (v6)
    {
      NSLog(&cfstr_ErrorLookingFo.isa, *(void *)(a1 + 32), v6);
      uint64_t v7 = 0;
    }
    v8 = [v3 logCountByPath];
    uint64_t v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v10 = [v9 unsignedLongValue];

    if (v10 != v7)
    {
      dispatch_queue_t v11 = [NSNumber numberWithUnsignedLong:v7];
      v12 = [v3 logCountByPath];
      [v12 setObject:v11 forKeyedSubscript:*(void *)(a1 + 32)];

      id v13 = [v3 logUpdateCallback];
      v13[2]();
    }
  }
}

uint64_t __69__HTHangsDataFinder_initWithLogUpdateCallback_tailspinSavedCallback___block_invoke_3(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HTHangsDataFinder;
  [(HTHangsDataFinder *)&v4 dealloc];
}

- (id)getFilteredLogURLsForPath:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  unsigned __int8 v18 = 0;
  uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
  int v8 = [v7 fileExistsAtPath:v6 isDirectory:&v18];
  int v9 = v18;

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v16 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    dispatch_queue_t v11 = [MEMORY[0x263F08850] defaultManager];
    v12 = [NSURL fileURLWithPath:v6 isDirectory:v18];
    v19[0] = *MEMORY[0x263EFF740];
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    id v14 = [v11 contentsOfDirectoryAtURL:v12 includingPropertiesForKeys:v13 options:0 error:a4];

    uint64_t v15 = [(HTHangsDataFinder *)self hangLogPredicate];
    v16 = [v14 filteredArrayUsingPredicate:v15];
  }

  return v16;
}

- (id)dateFromString:(id)a3
{
  id v3 = a3;
  objc_super v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];
  uint64_t v6 = [v5 length];

  if (v6 && ([v3 doubleValue], v7 != 0.0))
  {
    int v9 = (void *)MEMORY[0x263EFF910];
    [v3 doubleValue];
    int v8 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)hangsDataEntryAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  NSLog(&cfstr_LookingForData.isa, v6);
  double v7 = [(HTHangsDataFinder *)self getFilteredLogURLsForPath:v6 error:a4];
  int v8 = [MEMORY[0x263EFF980] array];
  int v9 = [MEMORY[0x263EFF9A0] dictionary];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__HTHangsDataFinder_hangsDataEntryAtPath_error___block_invoke;
  v16[3] = &unk_265353FA8;
  id v17 = v6;
  unsigned __int8 v18 = self;
  id v19 = v9;
  id v10 = v8;
  id v20 = v10;
  id v11 = v9;
  id v12 = v6;
  [v7 enumerateObjectsUsingBlock:v16];
  id v13 = v20;
  id v14 = v10;

  return v14;
}

void __48__HTHangsDataFinder_hangsDataEntryAtPath_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v14 = 0;
  uint64_t v4 = *MEMORY[0x263EFF740];
  id v13 = 0;
  int v5 = [v3 getResourceValue:&v14 forKey:v4 error:&v13];
  id v6 = v14;
  id v7 = v13;
  if (v5 && ([v6 BOOLValue] & 1) == 0)
  {
    NSLog(&cfstr_UrlDoesNotHave.isa, v3);
  }
  else
  {
    int v8 = *(void **)(a1 + 32);
    int v9 = [v3 lastPathComponent];
    id v10 = [v8 stringByAppendingPathComponent:v9];

    id v11 = [[HTHangExtendedAttributes alloc] initWithFilePath:v10];
    id v12 = [*(id *)(a1 + 40) hangsDataEntryWithFullPath:v10 extendedAttributes:v11 cachedAppRecords:*(void *)(a1 + 48)];
    if (v12) {
      [*(id *)(a1 + 56) addObject:v12];
    }
  }
}

- (id)hangsDataEntryWithFullPath:(id)a3 extendedAttributes:(id)a4 cachedAppRecords:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 bundleID];
  if (v11
    && (id v12 = (void *)v11,
        [v9 hangID],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    id v14 = [v9 bundleID];
    uint64_t v26 = [(HTHangsDataFinder *)self appRecordWithBundleId:v14 cachedAppRecords:v10];

    v25 = [HTHangsDataEntry alloc];
    int v24 = [v9 hangID];
    uint64_t v15 = [v9 creationDate];
    v16 = [(HTHangsDataFinder *)self dateFromString:v15];
    id v17 = [v9 duration];
    [v17 doubleValue];
    double v19 = v18;
    id v20 = [v9 bundleID];
    v21 = [v9 processPath];
    id v22 = [(HTHangsDataEntry *)v25 initWithPath:v8 hangID:v24 creationDate:v16 duration:v20 processBundleID:v21 processPath:v26 processRecord:v19];
  }
  else
  {
    NSLog(&cfstr_EntryAtPathIsM.isa, v8);
    id v22 = 0;
  }

  return v22;
}

- (id)appRecordWithBundleId:(id)a3 cachedAppRecords:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:v5];
  if (!v7)
  {
    id v12 = 0;
    id v7 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v5 allowPlaceholder:0 error:&v12];
    id v8 = (__CFString *)v12;
    id v9 = v8;
    if (!v8 && v7) {
      goto LABEL_7;
    }
    id v10 = @"No error, app was not found";
    if (v8) {
      id v10 = v8;
    }
    NSLog(&cfstr_UnableToRetrie_0.isa, v5, v10);
    if (v7) {
LABEL_7:
    }
      [v6 setObject:v7 forKeyedSubscript:v5];
  }

  return v7;
}

+ (id)groupEntriesByHangID:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "hangID", (void)v17);
        if (v11)
        {
          id v12 = [v4 objectForKeyedSubscript:v11];

          if (!v12)
          {
            id v13 = [MEMORY[0x263EFF980] array];
            [v4 setObject:v13 forKeyedSubscript:v11];
          }
          id v14 = [v4 objectForKeyedSubscript:v11];
          [v14 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  uint64_t v15 = (void *)[v4 copy];

  return v15;
}

- (void)findEventsFilteringDeveloperApps:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  NSLog(&cfstr_FindingHangEve.isa, v4);
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke;
  block[3] = &unk_265354048;
  BOOL v11 = v4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke(uint64_t a1)
{
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__41;
  v17[4] = __Block_byref_object_dispose__42;
  id v18 = 0;
  v2 = [MEMORY[0x263EFF980] array];
  id v3 = getDataTypePaths();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke_43;
  v12[3] = &unk_265353FF8;
  BOOL v4 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  uint64_t v15 = v17;
  char v16 = *(unsigned char *)(a1 + 48);
  id v14 = v4;
  id v5 = v2;
  id v13 = v5;
  [v3 enumerateObjectsUsingBlock:v12];

  id v6 = +[HTHangsDataFinder groupEntriesByHangID:v5];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke_3;
  block[3] = &unk_265354020;
  id v7 = *(id *)(a1 + 40);
  id v10 = v6;
  id v11 = v7;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v17, 8);
}

void __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke_43(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = [v7 hangsDataEntryAtPath:a2 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (*(unsigned char *)(a1 + 64))
  {
    id v10 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_126];
    uint64_t v11 = [v9 filteredArrayUsingPredicate:v10];

    id v9 = (void *)v11;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    NSLog(&cfstr_ThereWasAnErro.isa, a3);
    *a4 = 1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke_2;
    block[3] = &unk_265353FD0;
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    id v15 = v12;
    uint64_t v16 = v13;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    NSLog(&cfstr_AddingLuEntrie.isa, [v9 count]);
    [*(id *)(a1 + 40) addObjectsFromArray:v9];
  }
}

uint64_t __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t __72__HTHangsDataFinder_findEventsFilteringDeveloperApps_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)findProcessingEventsFilteringDeveloperApps:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v15 = v4;
    _os_log_impl(&dword_250BB6000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Getting pending hangs list (filtering on developer apps: %d)", buf, 8u);
  }
  hangReporterService = self->_hangReporterService;
  if (hangReporterService
    || (uint64_t v8 = objc_alloc_init(HTHangReporterService),
        id v9 = self->_hangReporterService,
        self->_hangReporterService = v8,
        v9,
        (hangReporterService = self->_hangReporterService) != 0))
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __82__HTHangsDataFinder_findProcessingEventsFilteringDeveloperApps_completionHandler___block_invoke;
    v11[3] = &unk_265354070;
    v11[4] = self;
    id v12 = v6;
    BOOL v13 = v4;
    [(HTHangReporterService *)hangReporterService getProcessingHangsWithCompletion:v11];
    id v10 = v12;
  }
  else
  {
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4099 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

void __82__HTHangsDataFinder_findProcessingEventsFilteringDeveloperApps_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v34 = a1;
    id v30 = v6;
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    v33 = [MEMORY[0x263EFF9A0] dictionary];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v31 = v5;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(obj);
          }
          BOOL v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v14 = *(void **)(v34 + 32);
          BOOL v15 = [v13 bundleID];
          uint64_t v16 = [v14 appRecordWithBundleId:v15 cachedAppRecords:v33];

          long long v17 = [HTHangsDataEntry alloc];
          id v18 = [v13 identifier];
          long long v19 = [v13 creationDate];
          [v13 duration];
          double v21 = v20;
          uint64_t v22 = [v13 bundleID];
          int v23 = [v13 processPath];
          int v24 = [(HTHangsDataEntry *)v17 initWithPath:0 hangID:v18 creationDate:v19 duration:v22 processBundleID:v23 processPath:v16 processRecord:v21];

          [v8 addObject:v24];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v10);
    }

    if (*(unsigned char *)(v34 + 48))
    {
      v25 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_126];
      [v8 filterUsingPredicate:v25];
    }
    id v7 = v30;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [v8 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v46 = v26;
      _os_log_impl(&dword_250BB6000, &_os_log_internal, OS_LOG_TYPE_INFO, "Found %lu pending hangs entries", buf, 0xCu);
    }
    v27 = +[HTHangsDataFinder groupEntriesByHangID:v8];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__HTHangsDataFinder_findProcessingEventsFilteringDeveloperApps_completionHandler___block_invoke_54;
    block[3] = &unk_265354020;
    id v28 = *(id *)(v34 + 40);
    id v36 = v27;
    id v37 = v28;
    id v29 = v27;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v5 = v31;
  }
  else
  {
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __82__HTHangsDataFinder_findProcessingEventsFilteringDeveloperApps_completionHandler___block_invoke_2;
    v42[3] = &unk_265354020;
    id v44 = *(id *)(a1 + 40);
    id v43 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v42);

    uint64_t v8 = v44;
  }
}

uint64_t __82__HTHangsDataFinder_findProcessingEventsFilteringDeveloperApps_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __82__HTHangsDataFinder_findProcessingEventsFilteringDeveloperApps_completionHandler___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)hangReporterDidSaveTailspin:(id)a3
{
  tailspinSavedCallback = (void (**)(void))self->_tailspinSavedCallback;
  if (tailspinSavedCallback) {
    tailspinSavedCallback[2]();
  }
}

- (NSPredicate)hangLogPredicate
{
  return self->_hangLogPredicate;
}

- (void)setHangLogPredicate:(id)a3
{
}

- (id)logUpdateCallback
{
  return self->_logUpdateCallback;
}

- (void)setLogUpdateCallback:(id)a3
{
}

- (id)tailspinSavedCallback
{
  return self->_tailspinSavedCallback;
}

- (void)setTailspinSavedCallback:(id)a3
{
}

- (NSMutableArray)folderWatchDispatchSrcs
{
  return self->_folderWatchDispatchSrcs;
}

- (void)setFolderWatchDispatchSrcs:(id)a3
{
}

- (OS_dispatch_queue)folderWatchTaskQueue
{
  return self->_folderWatchTaskQueue;
}

- (void)setFolderWatchTaskQueue:(id)a3
{
}

- (NSMutableDictionary)logCountByPath
{
  return self->_logCountByPath;
}

- (void)setLogCountByPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logCountByPath, 0);
  objc_storeStrong((id *)&self->_folderWatchTaskQueue, 0);
  objc_storeStrong((id *)&self->_folderWatchDispatchSrcs, 0);
  objc_storeStrong(&self->_tailspinSavedCallback, 0);
  objc_storeStrong(&self->_logUpdateCallback, 0);
  objc_storeStrong((id *)&self->_hangLogPredicate, 0);

  objc_storeStrong((id *)&self->_hangReporterService, 0);
}

@end