@interface AFUIDebugLogManager
+ (int)executeSystemCommand:(id)a3 stdoutTo:(id)a4;
- (AFUIDebugLogManager)init;
- (NSURL)_baseLogDirectoryURL;
- (NSURL)_siriLogDirectoryURL;
- (OS_dispatch_queue)_queue;
- (id)_archiveLogDirectoryAtURL:(id)a3 name:(id)a4 error:(id *)a5;
- (id)_captureLogsInDirectoryAtURL:(id)a3 matchingPattern:(id)a4 withMimeType:(id)a5 attemptCompression:(BOOL)a6 limit:(int64_t)a7 error:(id *)a8;
- (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 includingPropertiesForKeys:(id)a5 error:(id *)a6;
- (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 sortedByDateWithResourceKey:(id)a5 error:(id *)a6;
- (id)_siriCardLogDirectoryURL;
- (id)_uniqueTemporaryFileURL;
- (void)_captureFileAtURL:(id)a3 completion:(id)a4;
- (void)_captureLogsAtURL:(id)a3 logName:(id)a4 sinceTime:(double)a5 completion:(id)a6;
- (void)_captureLogsAtURL:(id)a3 logName:(id)a4 sinceTime:(double)a5 pattern:(id)a6 mimeType:(id)a7 completion:(id)a8;
- (void)captureCardLogsSinceTime:(double)a3 completion:(id)a4;
- (void)capturePreviousConversationWithCompletion:(id)a3;
- (void)captureSiriSpeechLogsWithCompletion:(id)a3;
- (void)captureSiriTTSAudioWithCompletion:(id)a3;
- (void)captureSiriVoiceTriggerLogsWithCompletion:(id)a3;
- (void)captureViewHierarchyLogWithDefaultViewHierarchy:(id)a3 completion:(id)a4;
@end

@implementation AFUIDebugLogManager

- (AFUIDebugLogManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AFUIDebugLogManager;
  v2 = [(AFUIDebugLogManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Siri log manager queue", MEMORY[0x263EF83A8]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)captureViewHierarchyLogWithDefaultViewHierarchy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__AFUIDebugLogManager_captureViewHierarchyLogWithDefaultViewHierarchy_completion___block_invoke;
    aBlock[3] = &unk_264692F70;
    id v14 = v7;
    v9 = _Block_copy(aBlock);
    v10 = v9;
    if (v6)
    {
      (*((void (**)(void *, id))v9 + 2))(v9, v6);
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__AFUIDebugLogManager_captureViewHierarchyLogWithDefaultViewHierarchy_completion___block_invoke_2;
      block[3] = &unk_264691BC8;
      block[4] = self;
      id v12 = v9;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __82__AFUIDebugLogManager_captureViewHierarchyLogWithDefaultViewHierarchy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 dataUsingEncoding:4];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = +[AFUIDebugLog logWithData:v5 mimeType:@"text/*" name:@"siri_view_hierarchy_description.txt" attemptCompression:1];
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);
}

void __82__AFUIDebugLogManager_captureViewHierarchyLogWithDefaultViewHierarchy_completion___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F82E88] keyWindow];
  uint64_t v3 = [v2 recursiveDescription];

  v4 = [*(id *)(a1 + 32) _queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__AFUIDebugLogManager_captureViewHierarchyLogWithDefaultViewHierarchy_completion___block_invoke_3;
  v7[3] = &unk_264691FC8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __82__AFUIDebugLogManager_captureViewHierarchyLogWithDefaultViewHierarchy_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)captureCardLogsSinceTime:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = [(AFUIDebugLogManager *)self _siriCardLogDirectoryURL];
  id v7 = [NSString stringWithFormat:@"^%@-", @"siri-card"];
  [(AFUIDebugLogManager *)self _captureLogsAtURL:v8 logName:@"siri-card" sinceTime:v7 pattern:0 mimeType:v6 completion:a3];
}

- (void)captureSiriSpeechLogsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AFUIDebugLogManager *)self _queue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __59__AFUIDebugLogManager_captureSiriSpeechLogsWithCompletion___block_invoke;
    v6[3] = &unk_264691BC8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __59__AFUIDebugLogManager_captureSiriSpeechLogsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _siriLogDirectoryURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"SpeechLogs"];

  id v4 = *(void **)(a1 + 32);
  id v19 = 0;
  id v5 = [v4 _captureLogsInDirectoryAtURL:v3 matchingPattern:@".*\\.spx$" withMimeType:@"audio/speex" attemptCompression:0 limit:5 error:&v19];
  id v6 = v19;
  id v7 = *(void **)(a1 + 32);
  id v18 = 0;
  id v8 = [v7 _captureLogsInDirectoryAtURL:v3 matchingPattern:@".*\\.opx$" withMimeType:@"audio/opus" attemptCompression:0 limit:5 error:&v18];
  id v9 = v18;
  v10 = *(void **)(a1 + 32);
  id v17 = 0;
  v11 = [v10 _captureLogsInDirectoryAtURL:v3 matchingPattern:@".*\\.wav$" withMimeType:@"audio/wav" attemptCompression:0 limit:5 error:&v17];
  id v12 = v17;
  if (v5 || v8 || v11)
  {
    v15 = [MEMORY[0x263EFF980] array];
    v16 = v15;
    if (v5) {
      [v15 addObjectsFromArray:v5];
    }
    if (v8) {
      [v16 addObjectsFromArray:v8];
    }
    if (v11) {
      [v16 addObjectsFromArray:v11];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v9) {
      id v13 = v9;
    }
    else {
      id v13 = v12;
    }
    if (v6) {
      id v14 = v6;
    }
    else {
      id v14 = v13;
    }
    (*(void (**)(void, void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v14);
  }
}

- (void)captureSiriVoiceTriggerLogsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AFUIDebugLogManager *)self _queue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __65__AFUIDebugLogManager_captureSiriVoiceTriggerLogsWithCompletion___block_invoke;
    v6[3] = &unk_264691BC8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __65__AFUIDebugLogManager_captureSiriVoiceTriggerLogsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F08850]);
  uint64_t v3 = [*(id *)(a1 + 32) _uniqueTemporaryFileURL];
  id v4 = [v3 URLByAppendingPathComponent:@"VoiceTrigger" isDirectory:1];

  id v66 = 0;
  LODWORD(v3) = [v2 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v66];
  id v5 = v66;
  if (v3) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v9 = [v4 path];
    v10 = [*(id *)(a1 + 32) _baseLogDirectoryURL];
    v11 = [v10 URLByAppendingPathComponent:@"VoiceTrigger"];
    id v12 = [v11 path];

    v52 = [v12 stringByAppendingPathComponent:@"audio"];
    id v13 = *(void **)(a1 + 32);
    v50 = v12;
    id v14 = [NSURL URLWithString:v12];
    uint64_t v15 = *MEMORY[0x263EFF610];
    uint64_t v65 = 0;
    uint64_t v48 = v15;
    v16 = objc_msgSend(v13, "_contentsOfDirectoryAtURL:matchingPattern:sortedByDateWithResourceKey:error:", v14, @".*\\.log$");
    id v47 = 0;

    v51 = v4;
    uint64_t v53 = a1;
    if (v16 && (unint64_t)[v16 count] >= 6)
    {
      uint64_t v17 = objc_msgSend(v16, "subarrayWithRange:", 0, 5);

      v16 = (void *)v17;
    }
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obuint64_t j = v16;
    uint64_t v18 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v62 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = NSString;
          v23 = [*(id *)(*((void *)&v61 + 1) + 8 * i) path];
          v24 = [v22 stringWithFormat:@"/bin/cp %@ %@", v23, v9];
          +[AFUIDebugLogManager executeSystemCommand:v24 stdoutTo:0];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
      }
      while (v19);
    }

    v25 = *(void **)(a1 + 32);
    v26 = [NSURL URLWithString:v52];
    id v60 = v47;
    v27 = [v25 _contentsOfDirectoryAtURL:v26 matchingPattern:@".*\\.*$" sortedByDateWithResourceKey:v48 error:&v60];
    id v49 = v60;

    if (v27 && (unint64_t)[v27 count] >= 0x1F)
    {
      uint64_t v28 = objc_msgSend(v27, "subarrayWithRange:", 0, 30);

      v27 = (void *)v28;
    }
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v29 = v27;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v57 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = NSString;
          v35 = [*(id *)(*((void *)&v56 + 1) + 8 * j) path];
          v36 = [v34 stringWithFormat:@"/bin/cp %@ %@", v35, v9];
          +[AFUIDebugLogManager executeSystemCommand:v36 stdoutTo:0];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v56 objects:v67 count:16];
      }
      while (v31);
    }
    v37 = v29;

    v38 = NSString;
    v39 = [v9 stringByAppendingString:@"/SAT"];
    v40 = [v38 stringWithFormat:@"/bin/cp -r %@ %@", @"/var/mobile/Library/VoiceTrigger/SAT", v39];
    +[AFUIDebugLogManager executeSystemCommand:v40 stdoutTo:0];

    v41 = [v9 stringByAppendingString:@"/codec_dump.txt"];
    +[AFUIDebugLogManager executeSystemCommand:@"/usr/local/bin/codecctl AppleCS42L71Audio dump" stdoutTo:v41];

    v42 = [v9 stringByAppendingString:@"/IOBorealisOwl_dump.txt"];
    +[AFUIDebugLogManager executeSystemCommand:@"/usr/sbin/ioreg -c com_apple_audio_IOBorealisOwl -r -w 0" stdoutTo:v42];

    v43 = [v9 stringByAppendingString:@"/boreaowlctl_dump.txt"];
    +[AFUIDebugLogManager executeSystemCommand:@"/usr/local/bin/boreaowlctl --dump-fw" stdoutTo:v43];

    v44 = [v9 stringByAppendingString:@"/AppleEmbeddedAudioDevice_dump.txt"];
    +[AFUIDebugLogManager executeSystemCommand:@"/usr/sbin/ioreg -c AppleEmbeddedAudioDevice -r -w 0" stdoutTo:v44];

    a1 = v53;
    v45 = *(void **)(v53 + 32);
    id v55 = v49;
    id v4 = v51;
    id v8 = [v45 _archiveLogDirectoryAtURL:v51 name:@"voicetrigger.tar.gz" error:&v55];
    id v7 = v55;

    v46 = [v51 URLByDeletingLastPathComponent];
    [v2 removeItemAtURL:v46 error:0];
  }
  else
  {
    id v7 = v5;
    id v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)captureSiriTTSAudioWithCompletion:(id)a3
{
  if (a3)
  {
    id v4 = (void (**)(id, void *, id))a3;
    id v5 = [(AFUIDebugLogManager *)self _baseLogDirectoryURL];
    BOOL v6 = [v5 URLByAppendingPathComponent:@"VoiceServices" isDirectory:1];

    id v9 = 0;
    id v7 = [(AFUIDebugLogManager *)self _captureLogsInDirectoryAtURL:v6 matchingPattern:@".*\\.wav$" withMimeType:@"audio/wav" attemptCompression:0 limit:10 error:&v9];
    id v8 = v9;
    v4[2](v4, v7, v8);
  }
}

+ (int)executeSystemCommand:(id)a3 stdoutTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 componentsSeparatedByString:@" "];
  unsigned int v8 = [v7 count];
  posix_spawnattr_t v19 = 0;
  posix_spawn_file_actions_t v20 = 0;
  *(void *)uint64_t v18 = 0;
  id v9 = (os_log_t *)MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    +[AFUIDebugLogManager executeSystemCommand:stdoutTo:]();
  }
  v10 = (const char **)malloc_type_calloc(v8 + 1, 8uLL, 0x10040436913F5uLL);
  uint64_t v11 = v8;
  if (v8)
  {
    uint64_t v12 = 0;
    do
    {
      id v13 = [v7 objectAtIndex:v12];
      v10[v12] = (const char *)[v13 cStringUsingEncoding:1];

      ++v12;
    }
    while (v11 != v12);
  }
  v10[v11] = 0;
  posix_spawnattr_init(&v19);
  posix_spawnattr_setflags(&v19, 0);
  if (v6)
  {
    posix_spawn_file_actions_init(&v20);
    posix_spawn_file_actions_addopen(&v20, 1, (const char *)[v6 cStringUsingEncoding:1], 521, 0x1A0u);
    sync();
    int v14 = posix_spawn(v18, *v10, &v20, &v19, (char *const *)v10, 0);
    posix_spawn_file_actions_destroy(&v20);
  }
  else
  {
    int v14 = posix_spawn(v18, *v10, 0, &v19, (char *const *)v10, 0);
  }
  posix_spawnattr_destroy(&v19);
  if (v14)
  {
    os_log_t v15 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)) {
      +[AFUIDebugLogManager executeSystemCommand:stdoutTo:]((uint64_t *)v10, v15, v14);
    }
    int v16 = 0;
  }
  else
  {
    waitpid(v18[0], &v18[1], 0);
    if ((v18[1] & 0x7F) != 0) {
      int v16 = -1;
    }
    else {
      int v16 = BYTE1(v18[1]);
    }
  }
  free(v10);

  return v16;
}

- (void)capturePreviousConversationWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AFUIDebugLogManager *)self _queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__AFUIDebugLogManager_capturePreviousConversationWithCompletion___block_invoke;
    block[3] = &unk_264691AC8;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

void __65__AFUIDebugLogManager_capturePreviousConversationWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = AFUIFileURLForConversationWithIdentifier(@"PreviousConversation");
  id v6 = 0;
  uint64_t v3 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v2 options:0 error:&v6];
  id v4 = v6;
  if (v3)
  {
    id v5 = +[AFUIDebugLog logWithData:v3 mimeType:@"application/x-plist" name:@"PreviousConversation" attemptCompression:1];
  }
  else
  {
    id v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_captureLogsAtURL:(id)a3 logName:(id)a4 sinceTime:(double)a5 completion:(id)a6
{
  v10 = NSString;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 stringWithFormat:@"^%@_.*\\.log$", v12];
  [(AFUIDebugLogManager *)self _captureLogsAtURL:v13 logName:v12 sinceTime:v14 pattern:@"text/plain" mimeType:v11 completion:a5];
}

- (void)_captureLogsAtURL:(id)a3 logName:(id)a4 sinceTime:(double)a5 pattern:(id)a6 mimeType:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    posix_spawnattr_t v19 = [(AFUIDebugLogManager *)self _queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__AFUIDebugLogManager__captureLogsAtURL_logName_sinceTime_pattern_mimeType_completion___block_invoke;
    block[3] = &unk_264692FC0;
    void block[4] = self;
    id v21 = v14;
    id v22 = v16;
    double v26 = a5;
    id v23 = v17;
    id v24 = v15;
    id v25 = v18;
    dispatch_async(v19, block);
  }
}

void __87__AFUIDebugLogManager__captureLogsAtURL_logName_sinceTime_pattern_mimeType_completion___block_invoke(uint64_t a1)
{
  v49[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v49[0] = *MEMORY[0x263EFF5F8];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:1];
  id v47 = 0;
  id v7 = [v3 _contentsOfDirectoryAtURL:v4 matchingPattern:v5 includingPropertiesForKeys:v6 error:&v47];
  id v8 = v47;

  if (v7)
  {
    id v9 = [MEMORY[0x263F08AB0] processInfo];
    [v9 systemUptime];
    uint64_t v37 = a1;
    double v11 = v10 - *(double *)(a1 + 80);

    id v12 = [MEMORY[0x263EFF910] date];
    id v13 = (void *)MEMORY[0x263F08A98];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __87__AFUIDebugLogManager__captureLogsAtURL_logName_sinceTime_pattern_mimeType_completion___block_invoke_2;
    v44[3] = &unk_264692F98;
    id v34 = v12;
    id v45 = v34;
    double v46 = v11;
    id v14 = [v13 predicateWithBlock:v44];
    v35 = v7;
    id v15 = [v7 filteredArrayUsingPredicate:v14];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = v15;
    uint64_t v16 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v41;
      while (2)
      {
        uint64_t v19 = 0;
        posix_spawn_file_actions_t v20 = v8;
        do
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v40 + 1) + 8 * v19);
          id v39 = v20;
          id v22 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v21 options:1 error:&v39];
          id v8 = v39;

          if (!v22)
          {
            id v29 = v2;
            v27 = obj;
            a1 = v37;
            id v2 = 0;
            double v26 = v34;
            id v7 = v35;
            goto LABEL_16;
          }
          uint64_t v23 = *(void *)(v37 + 56);
          id v24 = [v21 lastPathComponent];
          id v25 = +[AFUIDebugLog logWithData:v22 mimeType:v23 name:v24 attemptCompression:0];

          [v2 addObject:v25];
          ++v19;
          posix_spawn_file_actions_t v20 = v8;
        }
        while (v17 != v19);
        uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    if (v2)
    {
      a1 = v37;
      double v26 = v34;
      id v7 = v35;
      if (![v2 count])
      {
        v27 = [NSString stringWithFormat:@"%@-latest", *(void *)(v37 + 64)];
        uint64_t v28 = [*(id *)(v37 + 40) URLByAppendingPathComponent:v27];
        id v29 = [v28 URLByAppendingPathExtension:@"log"];

        id v38 = v8;
        uint64_t v30 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v29 options:1 error:&v38];
        id v31 = v38;

        if (v30)
        {
          uint64_t v32 = [v29 lastPathComponent];
          v33 = +[AFUIDebugLog logWithData:v30 mimeType:@"text/plain" name:v32 attemptCompression:0];

          [v2 addObject:v33];
        }

        id v8 = v31;
LABEL_16:
      }
    }
    else
    {
      a1 = v37;
      double v26 = v34;
      id v7 = v35;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

BOOL __87__AFUIDebugLogManager__captureLogsAtURL_logName_sinceTime_pattern_mimeType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = 0;
  uint64_t v4 = *MEMORY[0x263EFF5F8];
  id v11 = 0;
  char v5 = [v3 getResourceValue:&v12 forKey:v4 error:&v11];
  id v6 = v12;
  id v7 = v11;
  if ((v5 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __87__AFUIDebugLogManager__captureLogsAtURL_logName_sinceTime_pattern_mimeType_completion___block_invoke_2_cold_1();
  }
  [*(id *)(a1 + 32) timeIntervalSinceDate:v6];
  BOOL v9 = v8 <= *(double *)(a1 + 40);

  return v9;
}

- (void)_captureFileAtURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, id))a4;
  id v11 = 0;
  id v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5 options:1 error:&v11];
  id v8 = v11;
  if (v7)
  {
    BOOL v9 = [v5 lastPathComponent];
    double v10 = +[AFUIDebugLog logWithData:v7 mimeType:0 name:v9 attemptCompression:0];

    v6[2](v6, v10, v8);
  }
  else
  {
    v6[2](v6, 0, v8);
  }
}

- (id)_archiveLogDirectoryAtURL:(id)a3 name:(id)a4 error:(id *)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  double v10 = [(AFUIDebugLogManager *)self _uniqueTemporaryFileURL];
  id v11 = NSString;
  id v12 = [v10 path];
  id v13 = [v9 URLByDeletingLastPathComponent];
  id v14 = [v13 path];
  id v15 = [v9 lastPathComponent];

  uint64_t v16 = [v11 stringWithFormat:@"/usr/bin/tar czf %@ -C %@ %@", v12, v14, v15];

  if (+[AFUIDebugLogManager executeSystemCommand:v16 stdoutTo:0])
  {
    if (a5)
    {
      v21[0] = *MEMORY[0x263F08320];
      v21[1] = @"ArchiveCommand";
      v22[0] = @"Unable to archive directory.";
      v22[1] = v16;
      uint64_t v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
      *a5 = +[AFUIDebugError debugErrorWithCode:3 userInfo:v17];

      a5 = 0;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v10 options:0 error:a5];
    if (v18)
    {
      a5 = +[AFUIDebugLog logWithData:v18 mimeType:@"application/x-gtar" name:v8 attemptCompression:0];
    }
    else
    {
      a5 = 0;
    }
  }
  uint64_t v19 = objc_opt_new();
  [v19 removeItemAtURL:v10 error:0];

  return a5;
}

- (NSURL)_baseLogDirectoryURL
{
  return (NSURL *)[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter" isDirectory:1];
}

- (id)_captureLogsInDirectoryAtURL:(id)a3 matchingPattern:(id)a4 withMimeType:(id)a5 attemptCompression:(BOOL)a6 limit:(int64_t)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v33 = a5;
  uint64_t v16 = [MEMORY[0x263EFF980] array];
  uint64_t v17 = *MEMORY[0x263EFF610];
  id v35 = 0;
  uint64_t v18 = [(AFUIDebugLogManager *)self _contentsOfDirectoryAtURL:v14 matchingPattern:v15 sortedByDateWithResourceKey:v17 error:&v35];
  id v19 = v35;
  posix_spawn_file_actions_t v20 = v19;
  if (v18) {
    BOOL v21 = a7 < 1;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21)
  {
    id v22 = v19;
    if (!v19) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  uint64_t v30 = a8;
  id v31 = v15;
  id v32 = v14;
  unint64_t v23 = 0;
  while (1)
  {
    if (objc_msgSend(v18, "count", v30, v31, v32) <= v23)
    {
      id v22 = v20;
      goto LABEL_14;
    }
    id v24 = [v18 objectAtIndex:v23];
    id v25 = objc_alloc(MEMORY[0x263EFF8F8]);
    id v34 = v20;
    double v26 = (void *)[v25 initWithContentsOfURL:v24 options:1 error:&v34];
    id v22 = v34;

    if (!v26) {
      break;
    }
    v27 = [v24 lastPathComponent];
    uint64_t v28 = +[AFUIDebugLog logWithData:v26 mimeType:v33 name:v27 attemptCompression:v10];
    [v16 addObject:v28];

    ++v23;
    posix_spawn_file_actions_t v20 = v22;
    if (a7 == v23) {
      goto LABEL_14;
    }
  }

  uint64_t v16 = 0;
LABEL_14:
  id v15 = v31;
  id v14 = v32;
  a8 = v30;
  if (v22)
  {
LABEL_15:

    uint64_t v16 = 0;
    if (a8) {
      *a8 = v22;
    }
  }
LABEL_17:

  return v16;
}

- (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 includingPropertiesForKeys:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:a4 options:17 error:a6];
  if (v11)
  {
    id v12 = objc_opt_new();
    id v13 = [v12 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:v10 options:0 error:a6];
    if (v13)
    {
      id v14 = (void *)MEMORY[0x263F08A98];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      pid_t v18[2] = __98__AFUIDebugLogManager__contentsOfDirectoryAtURL_matchingPattern_includingPropertiesForKeys_error___block_invoke;
      v18[3] = &unk_264692FE8;
      id v19 = v11;
      id v15 = [v14 predicateWithBlock:v18];
      uint64_t v16 = [v13 filteredArrayUsingPredicate:v15];
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

BOOL __98__AFUIDebugLogManager__contentsOfDirectoryAtURL_matchingPattern_includingPropertiesForKeys_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 lastPathComponent];
  BOOL v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  return v4;
}

- (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 sortedByDateWithResourceKey:(id)a5 error:(id *)a6
{
  v26[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unint64_t v23 = __Block_byref_object_copy__1;
  id v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  v26[0] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  id v14 = [(AFUIDebugLogManager *)self _contentsOfDirectoryAtURL:v10 matchingPattern:v11 includingPropertiesForKeys:v13 error:a6];

  if (v14)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __99__AFUIDebugLogManager__contentsOfDirectoryAtURL_matchingPattern_sortedByDateWithResourceKey_error___block_invoke;
    v17[3] = &unk_264693010;
    id v18 = v12;
    id v19 = &v20;
    id v15 = [v14 sortedArrayUsingComparator:v17];
  }
  else
  {
    id v15 = 0;
  }
  if (v21[5])
  {

    id v15 = 0;
    if (a6) {
      *a6 = (id) v21[5];
    }
  }

  _Block_object_dispose(&v20, 8);

  return v15;
}

uint64_t __99__AFUIDebugLogManager__contentsOfDirectoryAtURL_matchingPattern_sortedByDateWithResourceKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  obuint64_t j = 0;
  id v25 = 0;
  id v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  char v8 = [v5 getResourceValue:&v25 forKey:*(void *)(a1 + 32) error:&obj];
  id v9 = v25;
  objc_storeStrong(v7, obj);
  id v10 = (os_log_t *)MEMORY[0x263F28348];
  if ((v8 & 1) == 0)
  {
    id v11 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 136315906;
      v27 = "-[AFUIDebugLogManager _contentsOfDirectoryAtURL:matchingPattern:sortedByDateWithResourceKey:error:]_block_invoke";
      __int16 v28 = 2114;
      uint64_t v29 = v18;
      __int16 v30 = 2114;
      id v31 = v5;
      __int16 v32 = 2114;
      uint64_t v33 = v19;
      _os_log_error_impl(&dword_223099000, v11, OS_LOG_TYPE_ERROR, "%s Unable to get %{public}@ for file at %{public}@: %{public}@", buf, 0x2Au);
    }
  }
  id v22 = 0;
  id v23 = 0;
  id v12 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  char v13 = [v6 getResourceValue:&v23 forKey:*(void *)(a1 + 32) error:&v22];
  id v14 = v23;
  objc_storeStrong(v12, v22);
  if ((v13 & 1) == 0)
  {
    id v15 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 136315906;
      v27 = "-[AFUIDebugLogManager _contentsOfDirectoryAtURL:matchingPattern:sortedByDateWithResourceKey:error:]_block_invoke";
      __int16 v28 = 2114;
      uint64_t v29 = v20;
      __int16 v30 = 2114;
      id v31 = v6;
      __int16 v32 = 2114;
      uint64_t v33 = v21;
      _os_log_error_impl(&dword_223099000, v15, OS_LOG_TYPE_ERROR, "%s Unable to get %{public}@ for file at %{public}@: %{public}@", buf, 0x2Au);
    }
  }
  uint64_t v16 = [v14 compare:v9];

  return v16;
}

- (NSURL)_siriLogDirectoryURL
{
  id v2 = NSURL;
  id v3 = AFLogDirectory();
  BOOL v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  return (NSURL *)v4;
}

- (id)_siriCardLogDirectoryURL
{
  id v2 = NSURL;
  id v3 = AFLogDirectory();
  BOOL v4 = [v3 stringByAppendingPathComponent:@"CardLogs"];
  id v5 = [v2 fileURLWithPath:v4 isDirectory:1];

  return v5;
}

- (id)_uniqueTemporaryFileURL
{
  id v2 = NSURL;
  id v3 = NSTemporaryDirectory();
  BOOL v4 = [v2 fileURLWithPath:v3];
  id v5 = [MEMORY[0x263F08C38] UUID];
  id v6 = [v5 UUIDString];
  id v7 = [v4 URLByAppendingPathComponent:v6];

  return v7;
}

- (OS_dispatch_queue)_queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

+ (void)executeSystemCommand:(int)a3 stdoutTo:.cold.1(uint64_t *a1, void *a2, int a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  id v5 = a2;
  int v6 = 136315650;
  id v7 = "+[AFUIDebugLogManager executeSystemCommand:stdoutTo:]";
  __int16 v8 = 2082;
  uint64_t v9 = v4;
  __int16 v10 = 2082;
  id v11 = strerror(a3);
  _os_log_error_impl(&dword_223099000, v5, OS_LOG_TYPE_ERROR, "%s Failed to spawn %{public}s: %{public}s", (uint8_t *)&v6, 0x20u);
}

+ (void)executeSystemCommand:stdoutTo:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_223099000, v0, OS_LOG_TYPE_ERROR, "%s Running Command ---> %{public}@", (uint8_t *)v1, 0x16u);
}

void __87__AFUIDebugLogManager__captureLogsAtURL_logName_sinceTime_pattern_mimeType_completion___block_invoke_2_cold_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_223099000, v2, OS_LOG_TYPE_ERROR, "%s Couldn't get modification date for log at %{public}@: %{public}@", (uint8_t *)v3, 0x20u);
}

@end