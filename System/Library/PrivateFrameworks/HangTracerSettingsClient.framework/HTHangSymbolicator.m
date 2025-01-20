@interface HTHangSymbolicator
+ (BOOL)isLogFileSymbolicated:(id)a3;
+ (HTHangSymbolicator)sharedSymbolicator;
+ (id)symbolicatedLogURLForFile:(id)a3;
- (BOOL)allowListingOnDemandVPNs;
- (BOOL)canSymbolicateLogFile:(id)a3;
- (HTHangSymbolicator)init;
- (void)setAllowListingOnDemandVPNs:(BOOL)a3;
- (void)symbolicateLogFile:(id)a3 completion:(id)a4;
- (void)symbolicateLogFiles:(id)a3 completion:(id)a4;
@end

@implementation HTHangSymbolicator

- (HTHangSymbolicator)init
{
  v10.receiver = self;
  v10.super_class = (Class)HTHangSymbolicator;
  v2 = [(HTHangSymbolicator *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(HTDeveloperSettings);
    settings = v2->_settings;
    v2->_settings = v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.DeveloperSettings.HangSymbolicator", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v2->_allowListingOnDemandVPNs = 0;
    v8 = v2;
  }

  return v2;
}

+ (HTHangSymbolicator)sharedSymbolicator
{
  if (sharedSymbolicator_onceToken != -1) {
    dispatch_once(&sharedSymbolicator_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedSymbolicator_instance;

  return (HTHangSymbolicator *)v2;
}

uint64_t __40__HTHangSymbolicator_sharedSymbolicator__block_invoke()
{
  sharedSymbolicator_instance = objc_alloc_init(HTHangSymbolicator);

  return MEMORY[0x270F9A758]();
}

- (BOOL)canSymbolicateLogFile:(id)a3
{
  id v4 = a3;
  if (![(HTDeveloperSettings *)self->_settings isInternalBuild]
    || +[HTHangSymbolicator isLogFileSymbolicated:v4]
    || (+[HTHangSymbolicator symbolicatedLogURLForFile:](HTHangSymbolicator, "symbolicatedLogURLForFile:", v4), v5 = objc_claimAutoreleasedReturnValue(), char v6 = [v5 checkResourceIsReachableAndReturnError:0], v5, (v6 & 1) != 0))
  {
    char v7 = 0;
  }
  else
  {
    v9 = [v4 pathExtension];
    if ([v9 isEqualToString:@"synced"])
    {
      objc_super v10 = [v4 URLByDeletingPathExtension];
      uint64_t v11 = [v10 pathExtension];

      v9 = (void *)v11;
    }
    char v7 = [v9 isEqualToString:@"ips"];
  }
  return v7;
}

- (void)symbolicateLogFile:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke;
  block[3] = &unk_265353D70;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v25 = 0;
  v3 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v2 options:0 error:&v25];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F089E0];
    v5 = [NSURL URLWithString:@"https://speedtracer.apple.com/api/v2/trace"];
    id v6 = [v4 requestWithURL:v5];

    [v6 setHTTPMethod:@"POST"];
    [v6 setValue:@"developer-settings-dev" forHTTPHeaderField:@"X-ST-GroupName"];
    id v7 = [MEMORY[0x263F08C38] UUID];
    v8 = [v7 UUIDString];

    id v9 = [NSString stringWithFormat:@"multipart/form-data boundary=%@", v8];;
    [v6 setValue:v9 forHTTPHeaderField:@"Content-Type"];

    id v10 = [MEMORY[0x263EFF990] data];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __requestWithLogFile_block_invoke;
    v26[3] = &unk_265353ED8;
    id v27 = v10;
    id v11 = v10;
    id v12 = (void (**)(void, void))MEMORY[0x253383B00](v26);
    v13 = [NSString stringWithFormat:@"\r\n--%@\r\n", v8];
    ((void (**)(void, void *))v12)[2](v12, v13);

    ((void (**)(void, __CFString *))v12)[2](v12, @"Content-Disposition: form-data; name=\"log_content\"; filename=\"CrashLog\"\r\n");
    ((void (**)(void, __CFString *))v12)[2](v12, @"Content-Type: text/plain\r\n\r\n");
    [v11 appendData:v3];
    id v14 = [NSString stringWithFormat:@"\r\n--%@--\r\n", v8];
    ((void (**)(void, void *))v12)[2](v12, v14);

    id v15 = v11;
  }
  else
  {
    id v15 = 0;
    id v6 = 0;
  }

  id v16 = v15;
  id v17 = v25;
  if (v6)
  {
    v18 = [MEMORY[0x263F08BF8] sharedSession];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_2;
    v22[3] = &unk_265353D98;
    id v24 = *(id *)(a1 + 48);
    int8x16_t v21 = *(int8x16_t *)(a1 + 32);
    id v19 = (id)v21.i64[0];
    int8x16_t v23 = vextq_s8(v21, v21, 8uLL);
    v20 = [v18 uploadTaskWithRequest:v6 fromData:v16 completionHandler:v22];
    [v20 resume];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v10 statusCode];
      id v12 = [v10 allHeaderFields];
      *(_DWORD *)buf = 134218242;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_250BB6000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Symbolication task returned with status code %ld: %@", buf, 0x16u);
    }
  }
  if (v7)
  {
    v13 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_12;
    block[3] = &unk_265353D70;
    id v22 = v7;
    id v24 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 40);
    dispatch_async(v13, block);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_2_cold_1((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_12(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v62 = 0;
  v3 = [MEMORY[0x263F08900] JSONObjectWithData:v2 options:0 error:&v62];
  id v4 = v62;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 objectForKeyedSubscript:@"symbolicated_log"],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    id v7 = +[HTHangSymbolicator symbolicatedLogURLForFile:*(void *)(a1 + 40)];
    id v8 = [MEMORY[0x263F08850] defaultManager];
    id v9 = [v8 temporaryDirectory];
    id v10 = [v7 lastPathComponent];
    uint64_t v11 = [v9 URLByAppendingPathComponent:v10];

    id v12 = [v6 dataUsingEncoding:4];
    id v61 = v4;
    id v55 = (id)v11;
    LODWORD(v10) = [v12 writeToURL:v11 options:1 error:&v61];
    id v13 = v61;

    if (v10)
    {
      v51 = v13;
      v52 = v7;
      v53 = v6;
      v54 = v3;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      uint64_t v14 = *MEMORY[0x263F427C0];
      v63[0] = *MEMORY[0x263F427B8];
      v63[1] = v14;
      uint64_t v15 = *MEMORY[0x263F427D8];
      v63[2] = *MEMORY[0x263F427D0];
      v63[3] = v15;
      v63[4] = *MEMORY[0x263F427C8];
      uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:5];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v57 objects:v64 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v58;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v58 != v19) {
              objc_enumerationMutation(v16);
            }
            int8x16_t v21 = *(void **)(*((void *)&v57 + 1) + 8 * v20);
            id v22 = (const char *)[*(id *)(a1 + 40) fileSystemRepresentation];
            id v23 = v21;
            ssize_t v24 = getxattr(v22, (const char *)[v23 UTF8String], 0, 0x2710uLL, 0, 0);
            if ((v24 & 0x8000000000000000) == 0)
            {
              size_t v25 = v24;
              uint64_t v26 = [MEMORY[0x263EFF990] dataWithLength:v24];
              __int16 v27 = (const char *)[*(id *)(a1 + 40) fileSystemRepresentation];
              id v28 = v23;
              uint64_t v29 = (const char *)[v28 UTF8String];
              id v30 = v26;
              getxattr(v27, v29, (void *)[v30 mutableBytes], v25, 0, 0);
              v31 = (const char *)[v55 fileSystemRepresentation];
              v32 = (const char *)[v28 UTF8String];
              id v33 = v30;
              setxattr(v31, v32, (const void *)[v33 bytes], v25, 0, 0);
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v57 objects:v64 count:16];
        }
        while (v18);
      }

      v34 = [MEMORY[0x263F08850] defaultManager];
      id v7 = v52;
      id v56 = v51;
      int v35 = [v34 moveItemAtURL:v55 toURL:v52 error:&v56];
      id v4 = v56;

      if (v35)
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        id v6 = v53;
        v3 = v54;
      }
      else
      {
        id v6 = v53;
        v3 = v54;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_12_cold_3((uint64_t)v4, v44, v45, v46, v47, v48, v49, v50);
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_12_cold_4((uint64_t)v13, v37, v38, v39, v40, v41, v42, v43);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      id v4 = v13;
    }
  }
  else
  {
    BOOL v36 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      if (v36) {
        __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_12_cold_2((uint64_t)v3, (void *)(a1 + 32));
      }
    }
    else if (v36)
    {
      __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_12_cold_1((uint64_t)v4, (void *)(a1 + 32));
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)symbolicateLogFiles:(id)a3 completion:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v18 = a4;
  group = dispatch_group_create();
  id v6 = [MEMORY[0x263EFF980] array];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy_;
  v45[4] = __Block_byref_object_dispose_;
  id v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  char v44 = 0;
  objc_initWeak(&location, self);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v39;
    uint64_t v19 = v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v11 = +[HTHangSymbolicator symbolicatedLogURLForFile:](HTHangSymbolicator, "symbolicatedLogURLForFile:", v10, v18, v19);
        if ([v11 checkResourceIsReachableAndReturnError:0])
        {
          [v6 addObject:v11];
        }
        else
        {
          v32[0] = MEMORY[0x263EF8330];
          v32[1] = 3221225472;
          v33[0] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke;
          v33[1] = &unk_265353E38;
          int v35 = v43;
          id v12 = group;
          v34 = v12;
          objc_copyWeak(&v37, &location);
          BOOL v36 = v45;
          id v13 = (void *)MEMORY[0x253383B00](v32);
          dispatch_group_enter(v12);
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_5;
          v28[3] = &unk_265353E88;
          id v29 = v6;
          id v14 = v13;
          id v31 = v14;
          id v30 = v12;
          [(HTHangSymbolicator *)self symbolicateLogFile:v10 completion:v28];

          objc_destroyWeak(&v37);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v7);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_7;
  block[3] = &unk_265353EB0;
  id v24 = v6;
  id v25 = obj;
  id v26 = v18;
  __int16 v27 = v45;
  id v15 = obj;
  id v16 = v6;
  id v17 = v18;
  dispatch_group_notify(group, MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&location);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);
}

void __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = [v3 domain];
    if ([v5 isEqual:*MEMORY[0x263F08570]])
    {
      uint64_t v6 = [v4 code];

      if (v6 == -1003)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        uint64_t v16 = 0;
        id v17 = &v16;
        uint64_t v18 = 0x2050000000;
        uint64_t v7 = (void *)getNEVPNManagerClass_softClass;
        uint64_t v19 = getNEVPNManagerClass_softClass;
        if (!getNEVPNManagerClass_softClass)
        {
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __getNEVPNManagerClass_block_invoke;
          v15[3] = &unk_265353D48;
          v15[4] = &v16;
          __getNEVPNManagerClass_block_invoke((uint64_t)v15);
          uint64_t v7 = (void *)v17[3];
        }
        id v8 = v7;
        _Block_object_dispose(&v16, 8);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_2;
        v11[3] = &unk_265353E10;
        objc_copyWeak(&v14, (id *)(a1 + 56));
        id v9 = *(id *)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 48);
        id v12 = v9;
        uint64_t v13 = v10;
        [v8 loadAllFromPreferencesWithCompletionHandler:v11];

        objc_destroyWeak(&v14);
      }
    }
    else
    {
    }
  }
}

void __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_3;
  v15[3] = &unk_265353DC0;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  uint64_t v7 = [v5 indexesOfObjectsPassingTest:v15];
  if ([v7 count])
  {
    id v8 = [v5 objectsAtIndexes:v7];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_4;
    block[3] = &unk_265353DE8;
    id v13 = v8;
    long long v11 = *(_OWORD *)(a1 + 32);
    id v9 = (id)v11;
    long long v14 = v11;
    id v10 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

  objc_destroyWeak(&v16);
}

uint64_t __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [v3 connection];
  uint64_t v6 = [v5 status];

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    uint64_t v7 = 0;
  }
  else if ([v3 isOnDemandEnabled])
  {
    uint64_t v7 = [WeakRetained allowListingOnDemandVPNs];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

void __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_5(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_6;
  block[3] = &unk_265353E60;
  id v10 = v5;
  id v11 = a1[4];
  id v12 = v6;
  id v14 = a1[6];
  id v13 = a1[5];
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_6(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
  if (*(void *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  uint64_t v2 = *(NSObject **)(a1 + 56);

  dispatch_group_leave(v2);
}

uint64_t __53__HTHangSymbolicator_symbolicateLogFiles_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 count];
  if (v4 == [*(id *)(a1 + 40) count]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  id v6 = *(uint64_t (**)(uint64_t, void *, uint64_t))(v2 + 16);

  return v6(v2, v3, v5);
}

+ (id)symbolicatedLogURLForFile:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 lastPathComponent];
  uint64_t v5 = [v4 pathExtension];
  int v6 = [v5 isEqualToString:@"synced"];

  if (v6)
  {
    uint64_t v7 = [v4 stringByDeletingPathExtension];

    uint64_t v4 = (void *)v7;
  }
  id v8 = [v4 pathExtension];
  id v9 = [v4 stringByDeletingPathExtension];

  id v10 = [v9 stringByAppendingString:@"_symbolicated"];

  id v11 = [v10 stringByAppendingPathExtension:v8];

  id v12 = [v3 URLByDeletingLastPathComponent];

  id v13 = [v12 URLByAppendingPathComponent:v11];

  return v13;
}

+ (BOOL)isLogFileSymbolicated:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 pathExtension];
  int v5 = [v4 isEqualToString:@"synced"];

  int v6 = v3;
  if (v5)
  {
    int v6 = [v3 URLByDeletingPathExtension];
  }
  uint64_t v7 = [v3 URLByDeletingPathExtension];
  id v8 = [v7 lastPathComponent];
  char v9 = [v8 hasSuffix:@"_symbolicated"];

  return v9;
}

- (BOOL)allowListingOnDemandVPNs
{
  return self->_allowListingOnDemandVPNs;
}

- (void)setAllowListingOnDemandVPNs:(BOOL)a3
{
  self->_allowListingOnDemandVPNs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_12_cold_1(uint64_t a1, void *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[[NSString alloc] initWithData:*a2 encoding:4];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_250BB6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error decoding response for symbolicated log: %@\n%@", v3, 0x16u);
}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_12_cold_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[[NSString alloc] initWithData:*a2 encoding:4];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_250BB6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unexpected response format for symbolicated log: %@\n%@", v3, 0x16u);
}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_12_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__HTHangSymbolicator_symbolicateLogFile_completion___block_invoke_12_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end