@interface ATXWatchFaceConfigurationCollector
+ (id)_watchFaceFromJSONObject:(id)a3;
+ (id)sharedInstance;
- (ATXWatchFaceConfigurationCollector)init;
- (NSArray)watchFaces;
- (id)_queue_readWatchFacesFromDisk;
- (void)_queue_writeWatchFacesToDisk:(id)a3;
- (void)refreshWithCompletion:(id)a3;
@end

@implementation ATXWatchFaceConfigurationCollector

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)sharedInstance_collector;

  return v2;
}

uint64_t __52__ATXWatchFaceConfigurationCollector_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_collector;
  sharedInstance_collector = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (ATXWatchFaceConfigurationCollector)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)ATXWatchFaceConfigurationCollector;
  v2 = [(ATXWatchFaceConfigurationCollector *)&v18 init];
  if (v2)
  {
    if ([MEMORY[0x1E4F93B08] isiPad])
    {
      v3 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[ATXWatchFaceConfigurationCollector init]";
        _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "%s: device is iPad, not initializing connection", buf, 0xCu);
      }
    }
    else
    {
      id v4 = objc_alloc(MEMORY[0x1E4F4B638]);
      v5 = [MEMORY[0x1E4F4B650] watchFaceConfigurationCacheFilePath];
      v6 = __atxlog_handle_lock_screen();
      uint64_t v7 = [v4 initWithCacheFilePath:v5 loggingHandle:v6 debugName:@"watch faces"];
      fileCache = v2->_fileCache;
      v2->_fileCache = (ATXGenericFileBasedCache *)v7;

      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.proactive.ATXWatchFaceConfigurationCollector", v9);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v10;

      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v13 = dispatch_queue_create("com.apple.proactive.ATXWatchFaceConfigurationCollector.Output", v12);
      outputQueue = v2->_outputQueue;
      v2->_outputQueue = (OS_dispatch_queue *)v13;

      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nanotimekit.devicelibraryserver" options:4096];
      connection = v2->_connection;
      v2->_connection = (NSXPCConnection *)v15;

      v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE35C30];
      [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v3];
      [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_184];
      [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_187];
      [(NSXPCConnection *)v2->_connection resume];
    }
  }
  return v2;
}

void __42__ATXWatchFaceConfigurationCollector_init__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315394;
    v2 = "-[ATXWatchFaceConfigurationCollector init]_block_invoke";
    __int16 v3 = 2112;
    id v4 = @"com.apple.nanotimekit.devicelibraryserver";
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEFAULT, "%s: connection to %@ invalidated", (uint8_t *)&v1, 0x16u);
  }
}

void __42__ATXWatchFaceConfigurationCollector_init__block_invoke_185()
{
  uint64_t v0 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __42__ATXWatchFaceConfigurationCollector_init__block_invoke_185_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (void)refreshWithCompletion:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
  else
  {
    connection = self->_connection;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke;
    v10[3] = &unk_1E5D04F50;
    id v6 = v4;
    id v11 = v6;
    uint64_t v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_189;
    v8[3] = &unk_1E5D06518;
    v8[4] = self;
    id v9 = v6;
    [v7 fetchLibraryAsJSON:v8];
  }
}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_189(uint64_t a1, void *a2, void *a3)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && !v6)
  {
    id v37 = 0;
    v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v37];
    id v9 = v37;
    if (v9 || !v8)
    {
      v20 = __atxlog_handle_lock_screen();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v8;
        id v11 = __atxlog_handle_lock_screen();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v39 = "-[ATXWatchFaceConfigurationCollector refreshWithCompletion:]_block_invoke";
          __int16 v40 = 2112;
          id v41 = v10;
          _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "%s: retrieved JSON array: %@", buf, 0x16u);
        }

        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_200;
        v36[3] = &unk_1E5D064A0;
        v36[4] = *(void *)(a1 + 32);
        v12 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", v36);
        uint64_t v13 = *(void *)(a1 + 32);
        v14 = *(NSObject **)(v13 + 24);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_2;
        v32[3] = &unk_1E5D064F0;
        v32[4] = v13;
        id v33 = v12;
        id v15 = *(id *)(a1 + 40);
        id v34 = v10;
        id v35 = v15;
        id v16 = v10;
        id v17 = v12;
        dispatch_async(v14, v32);

        id v9 = 0;
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v21 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_189_cold_2(v21, v22, v23, v24, v25, v26, v27, v28);
      }

      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v42 = *MEMORY[0x1E4F28568];
      v43[0] = @"JSON is not an array";
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
      id v9 = (id)[v29 initWithDomain:@"ATXWatchFaceConfigurationCollector" code:1 userInfo:v30];

      v20 = __atxlog_handle_lock_screen();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        uint64_t v31 = *(void *)(a1 + 40);
        if (v31) {
          (*(void (**)(uint64_t, void, id))(v31 + 16))(v31, 0, v9);
        }
        goto LABEL_21;
      }
    }
    __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_189_cold_1();
    goto LABEL_19;
  }
  objc_super v18 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_189_cold_4();
  }

  uint64_t v19 = *(void *)(a1 + 40);
  if (v19) {
    (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v7);
  }
LABEL_22:
}

id __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_200(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() _watchFaceFromJSONObject:v2];

  return v3;
}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_writeWatchFacesToDisk:", *(void *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 56);
  if (v2)
  {
    id v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_3;
    v4[3] = &unk_1E5D064C8;
    id v6 = v2;
    id v5 = *(id *)(a1 + 48);
    dispatch_async(v3, v4);
  }
}

uint64_t __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (NSArray)watchFaces
{
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = __Block_byref_object_copy__3;
    id v11 = __Block_byref_object_dispose__3;
    id v12 = 0;
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__ATXWatchFaceConfigurationCollector_watchFaces__block_invoke;
    v6[3] = &unk_1E5D06540;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(queue, v6);
    id v3 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }

  return (NSArray *)v3;
}

void __48__ATXWatchFaceConfigurationCollector_watchFaces__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = *(id **)(a1 + 32);
  if (v2[5])
  {
    uint64_t v3 = [v2[5] copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v6 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      id v15 = "-[ATXWatchFaceConfigurationCollector watchFaces]_block_invoke";
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "%s: returning in-memory watchfaces", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = objc_msgSend(v2, "_queue_readWatchFacesFromDisk");
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v10 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40);
      int v14 = 136315394;
      id v15 = "-[ATXWatchFaceConfigurationCollector watchFaces]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "%s: read watch faces from disk: %@", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(NSObject **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

+ (id)_watchFaceFromJSONObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = v3;
    id v5 = [v4 objectForKeyedSubscript:@"faceJSON"];
    id v6 = [v4 objectForKeyedSubscript:@"selected"];
    unsigned int v7 = [v6 BOOLValue];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v15 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[ATXWatchFaceConfigurationCollector _watchFaceFromJSONObject:]();
      }

      int v14 = 0;
      goto LABEL_32;
    }
    id v8 = v5;
    uint64_t v9 = [v8 objectForKeyedSubscript:@"face type"];
    id v10 = [v9 stringValue];

    uint64_t v11 = [v8 objectForKeyedSubscript:@"bundle id"];
    id v29 = [v11 stringValue];

    uint64_t v12 = [v8 objectForKeyedSubscript:@"customization"];
    objc_opt_class();
    unsigned int v28 = v7;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v8 objectForKeyedSubscript:@"customization"];
    }
    else
    {
      uint64_t v13 = 0;
    }

    __int16 v16 = [v13 objectForKeyedSubscript:@"content"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = [v13 objectForKeyedSubscript:@"content"];
    }
    else
    {
      uint64_t v17 = 0;
    }

    uint64_t v18 = [v13 objectForKeyedSubscript:@"color"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v13 objectForKeyedSubscript:@"color"];
    }
    else
    {
      uint64_t v19 = 0;
    }

    if ([v10 isEqualToString:@"astronomy"])
    {
      uint64_t v20 = 1;
    }
    else if ([v10 isEqualToString:@"spectrum-analog"])
    {
      uint64_t v20 = 2;
    }
    else if (([v10 isEqualToString:@"color"] & 1) != 0 {
           || ([v10 isEqualToString:@"color-rich"] & 1) != 0)
    }
    {
      uint64_t v20 = 10;
    }
    else if ([v10 isEqualToString:@"photos"])
    {
      uint64_t v20 = 3;
    }
    else if ([v10 isEqualToString:@"pride"])
    {
      uint64_t v20 = 4;
    }
    else if (([v10 isEqualToString:@"pride analog"] & 1) != 0 {
           || ([v10 isEqualToString:@"pride analog rich"] & 1) != 0)
    }
    {
      uint64_t v20 = 11;
    }
    else if ([v10 isEqualToString:@"big-numerals-analog"] {
           && ([v19 isEqualToString:@"multicolor gradient 1"] & 1) != 0)
    }
    {
      uint64_t v20 = 14;
    }
    else if ([v10 isEqualToString:@"big-numerals-digital"] {
           && ([v19 isEqualToString:@"multicolor gradient 1"] & 1) != 0)
    }
    {
      uint64_t v20 = 15;
    }
    else
    {
      if (![v10 isEqualToString:@"california"]
        || ([v19 isEqualToString:@"style 10"] & 1) == 0)
      {
        uint64_t v27 = v29;
        if ([v29 length])
        {
          if ([v29 isEqualToString:@"com.apple.NTKAegirFaceBundle"])
          {
            if ([v17 isEqualToString:@"earth"])
            {
              uint64_t v20 = 7;
              goto LABEL_25;
            }
            if ([v17 isEqualToString:@"luna"])
            {
              uint64_t v20 = 8;
              goto LABEL_25;
            }
            if ([v17 isEqualToString:@"orrery"])
            {
              uint64_t v20 = 9;
              goto LABEL_25;
            }
            uint64_t v27 = v29;
            if ([v17 isEqualToString:@"random"])
            {
              uint64_t v20 = 17;
              goto LABEL_25;
            }
          }
          if ([v27 isEqualToString:@"com.apple.NanoTimeKit.NTKPrideWeaveFaceBundle"])
          {
            uint64_t v20 = 13;
            goto LABEL_25;
          }
          if ([v27 isEqualToString:@"com.apple.NTKLilypadFaceBundle"])
          {
            uint64_t v20 = 12;
            goto LABEL_25;
          }
          if ([v29 isEqualToString:@"com.apple.NTKRenegadeFaceBundle"])
          {
            uint64_t v20 = 5;
            goto LABEL_25;
          }
          if ([v29 isEqualToString:@"com.apple.NTKColtanFaceBundle"])
          {
            uint64_t v20 = 6;
            goto LABEL_25;
          }
        }
        uint64_t v20 = 0;
        goto LABEL_25;
      }
      uint64_t v20 = 16;
    }
LABEL_25:

    uint64_t v21 = [v8 objectForKeyedSubscript:@"complications"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = [v21 allValues];
      uint64_t v23 = objc_msgSend(v22, "_pas_mappedArrayWithTransform:", &__block_literal_global_205);
    }
    else
    {
      uint64_t v23 = 0;
    }
    uint64_t v24 = [ATXWatchFace alloc];
    if (v23) {
      uint64_t v25 = v23;
    }
    else {
      uint64_t v25 = (void *)MEMORY[0x1E4F1CBF0];
    }
    int v14 = [(ATXWatchFace *)v24 initWithStyle:v20 complications:v25 selected:v28];

LABEL_32:
    goto LABEL_33;
  }
  uint64_t v4 = __atxlog_handle_lock_screen();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[ATXWatchFaceConfigurationCollector _watchFaceFromJSONObject:]();
  }
  int v14 = 0;
LABEL_33:

  return v14;
}

id __63__ATXWatchFaceConfigurationCollector__watchFaceFromJSONObject___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 objectForKeyedSubscript:@"app"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      uint64_t v5 = [&unk_1EFDF4F78 objectForKeyedSubscript:v4];
      id v6 = (void *)v5;
      if (v5) {
        unsigned int v7 = (void *)v5;
      }
      else {
        unsigned int v7 = v4;
      }
      id v8 = v7;
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_queue_readWatchFacesFromDisk
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  fileCache = self->_fileCache;
  id v4 = (void *)MEMORY[0x1AD0D3C30]();
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v6 = objc_opt_class();
  unsigned int v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [(ATXGenericFileBasedCache *)fileCache readSecureCodedObjectWithMaxValidAge:v7 allowableClasses:0 error:-1.0];

  return v8;
}

- (void)_queue_writeWatchFacesToDisk:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(ATXGenericFileBasedCache *)self->_fileCache storeSecureCodedObject:v5 error:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_watchFaces, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_fileCache, 0);
}

void __42__ATXWatchFaceConfigurationCollector_init__block_invoke_185_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: unable to grab remote object proxy: %@", v2, v3, v4, v5, 2u);
}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_189_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: could not deserialize json: %@", v2, v3, v4, v5, 2u);
}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_189_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__ATXWatchFaceConfigurationCollector_refreshWithCompletion___block_invoke_189_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: error fetching library as JSON: %@", v2, v3, v4, v5, 2u);
}

+ (void)_watchFaceFromJSONObject:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: faceJSON object is not a dictionary: %@", v2, v3, v4, v5, 2u);
}

+ (void)_watchFaceFromJSONObject:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "%s: watch face JSON object is not a dictionary: %@", v2, v3, v4, v5, 2u);
}

@end