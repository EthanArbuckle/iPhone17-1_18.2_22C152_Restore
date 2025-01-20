@interface CPSWebClipStore
+ (id)_readWebClipDictionaryRepresentationFromDiskWithWebClipIdentifier:(id)a3;
+ (id)_urlForWebClipWithIdentifier:(id)a3;
+ (id)sharedStore;
- (BOOL)_redirectPoweredByWebClipsWithApplicationBundleIdentifier:(id)a3 toParentApplicationBundleIdentifier:(id)a4 errors:(id *)a5;
- (BOOL)_removeWebClipWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_removeWebClipsWithApplicationBundleIdentifier:(id)a3 errors:(id *)a4;
- (BOOL)_saveWebClip:(id)a3 error:(id *)a4;
- (id)_appClips;
- (id)_bookmarkWebClips;
- (id)_copyOrReplaceExistingFileAtPath:(id)a3 withNewFileAtPath:(id)a4;
- (id)_createOrUpdateExistingWebClipWithClipMetadata:(id)a3 createdNewWebClip:(BOOL *)a4 error:(id *)a5;
- (id)_enumerateAndFilterClipsWithBlock:(id)a3;
- (id)_enumerateAndMapClipsWithBlock:(id)a3;
- (id)_fetchInstalledAppClips;
- (id)_init;
- (id)_removeFileFromPath:(id)a3;
- (id)_webClipsBackedbyAppClipIdentifier:(id)a3;
- (id)synchronouslyGetAppClipWithIdentifier:(id)a3;
- (void)_reloadSpringBoardIconForWebClipWithIdentifier:(id)a3;
- (void)createOrUpdateExistingWebClipWithMetadata:(id)a3 comletionHandler:(id)a4;
- (void)fetchAppClipsWithCompletionHandler:(id)a3;
- (void)fetchBookmarkWebClipsWithCompletionHandler:(id)a3;
- (void)fetchWebClipsURLStringForClientBundleID:(id)a3 completionHandler:(id)a4;
- (void)fetchWebClipsUUIDStringForClientBundleID:(id)a3 completionHandler:(id)a4;
- (void)getAppClipWithIdentifier:(id)a3 receiveOnQueue:(id)a4 completionHandler:(id)a5;
- (void)getAppClipWithURLHash:(id)a3 completionHandler:(id)a4;
- (void)getWebClipDictionaryWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getWebClipWithURL:(id)a3 completionHandler:(id)a4;
- (void)getWebClipsBackedbyAppClipIdentifier:(id)a3 completion:(id)a4;
- (void)purgeDuplicateWebClipsWithCompletionHandler:(id)a3;
- (void)redirectPoweredByWebClipsWithApplicationBundleIdentifier:(id)a3 toParentApplicationBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)reloadSpringBoardIconForWebClipWithIdentifier:(id)a3;
- (void)removeAppClipIconForWebClipWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeExpiredPoweredByWebClipsWithCompletionHandler:(id)a3;
- (void)removePoweredByWebClipsLastActivatedBefore:(id)a3 completion:(id)a4;
- (void)removeWebClipWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeWebClipsWithApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeWebClipsWithApplicationBundleIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)saveWebClip:(id)a3 completionHandler:(id)a4;
- (void)updateAppClipIcon:(id)a3 forWebClipWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)updateWebClipTitle:(id)a3 forAppClipBundleIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation CPSWebClipStore

+ (id)sharedStore
{
  if (sharedStore_onceToken != -1) {
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedStore_store;

  return v2;
}

uint64_t __30__CPSWebClipStore_sharedStore__block_invoke()
{
  sharedStore_store = [[CPSWebClipStore alloc] _init];

  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)CPSWebClipStore;
  v2 = [(CPSWebClipStore *)&v8 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"com.apple.ClipServices.%@.%p", objc_opt_class(), v2];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

+ (id)_urlForWebClipWithIdentifier:(id)a3
{
  id v3 = pathForWebClipWithIdentifier(a3);
  if (v3) {
    dispatch_queue_t v4 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v3];
  }
  else {
    dispatch_queue_t v4 = 0;
  }

  return v4;
}

+ (id)_readWebClipDictionaryRepresentationFromDiskWithWebClipIdentifier:(id)a3
{
  CFURLRef v3 = [a1 _urlForWebClipWithIdentifier:a3];
  CFURLRef v4 = v3;
  if (v3) {
    CFDictionaryRef v5 = CFBundleCopyInfoDictionaryForURL(v3);
  }
  else {
    CFDictionaryRef v5 = 0;
  }

  return v5;
}

- (void)redirectPoweredByWebClipsWithApplicationBundleIdentifier:(id)a3 toParentApplicationBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __130__CPSWebClipStore_redirectPoweredByWebClipsWithApplicationBundleIdentifier_toParentApplicationBundleIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_26424E9F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __130__CPSWebClipStore_redirectPoweredByWebClipsWithApplicationBundleIdentifier_toParentApplicationBundleIdentifier_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v7 = 0;
  [v2 _redirectPoweredByWebClipsWithApplicationBundleIdentifier:v3 toParentApplicationBundleIdentifier:v4 errors:&v7];
  id v5 = v7;
  uint64_t v6 = a1[7];
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

- (BOOL)_redirectPoweredByWebClipsWithApplicationBundleIdentifier:(id)a3 toParentApplicationBundleIdentifier:(id)a4 errors:(id *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v20 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [(CPSWebClipStore *)self _appClips];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v14 isPoweredBy])
        {
          v15 = [v14 applicationBundleIdentifier];
          int v16 = [v15 isEqualToString:v7];

          if (v16)
          {
            [v14 setApplicationBundleIdentifier:v8];
            id v21 = 0;
            [(CPSWebClipStore *)self _saveWebClip:v14 error:&v21];
            id v17 = v21;
            if (v17) {
              [v20 addObject:v17];
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  BOOL v18 = [v20 count] == 0;
  return v18;
}

- (void)removeWebClipsWithApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__CPSWebClipStore_removeWebClipsWithApplicationBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_26424E678;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __83__CPSWebClipStore_removeWebClipsWithApplicationBundleIdentifier_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v6 = 0;
  [v2 _removeWebClipsWithApplicationBundleIdentifier:v3 errors:&v6];
  id v4 = v6;
  uint64_t v5 = a1[6];
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }
}

- (BOOL)_removeWebClipsWithApplicationBundleIdentifier:(id)a3 errors:(id *)a4
{
  v20 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [(CPSWebClipStore *)self _appClips];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "applicationBundleIdentifier", v20);
        int v14 = [v13 isEqualToString:v5];

        if (v14)
        {
          v15 = [v12 identifier];
          id v21 = 0;
          [(CPSWebClipStore *)self _removeWebClipWithIdentifier:v15 error:&v21];
          id v16 = v21;
          if (v16) {
            [v6 addObject:v16];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  if ([v6 count]) {
    id v17 = v6;
  }
  else {
    id v17 = 0;
  }
  id *v20 = v17;
  BOOL v18 = [v6 count] == 0;

  return v18;
}

- (void)removeWebClipsWithApplicationBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__CPSWebClipStore_removeWebClipsWithApplicationBundleIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_26424E678;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __84__CPSWebClipStore_removeWebClipsWithApplicationBundleIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 32)];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [*(id *)(a1 + 40) _appClips];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [v9 applicationBundleIdentifier];
        int v11 = [v3 containsObject:v10];

        if (v11)
        {
          id v12 = [v9 identifier];
          id v13 = *(void **)(a1 + 40);
          id v17 = 0;
          [v13 _removeWebClipWithIdentifier:v12 error:&v17];
          id v14 = v17;
          if (v14) {
            [v2 addObject:v14];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  uint64_t v15 = *(void *)(a1 + 48);
  if (v15)
  {
    if ([v2 count]) {
      id v16 = v2;
    }
    else {
      id v16 = 0;
    }
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
  }
}

- (void)removeWebClipWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CPSWebClipStore_removeWebClipWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_26424E678;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __65__CPSWebClipStore_removeWebClipWithIdentifier_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v6 = 0;
  [v2 _removeWebClipWithIdentifier:v3 error:&v6];
  id v4 = v6;
  uint64_t v5 = a1[6];
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }
}

- (BOOL)_removeWebClipWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F08850];
  id v6 = a3;
  id v7 = [v5 defaultManager];
  uint64_t v8 = pathForWebClipWithIdentifier(v6);
  [v7 removeItemAtPath:v8 error:a4];

  uint64_t v9 = SBSSpringBoardServerPort();
  id v10 = v6;
  uint64_t v11 = [v10 UTF8String];

  int v12 = MEMORY[0x2166BE110](v9, v11);
  if (v12)
  {
    id v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CPSWebClipStore _removeWebClipWithIdentifier:error:](v12, v13);
    }
  }
  return !v12 && *a4 == 0;
}

- (void)saveWebClip:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CPSWebClipStore_saveWebClip_completionHandler___block_invoke;
  block[3] = &unk_26424E678;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __49__CPSWebClipStore_saveWebClip_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  uint64_t v4 = [v2 _saveWebClip:v3 error:&v7];
  id v5 = v7;
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v4, v5);
  }
}

- (BOOL)_saveWebClip:(id)a3 error:(id *)a4
{
  v51[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 webClipType] == 1)
  {
    id v7 = [v6 identifier];
    uint64_t v8 = pathForWebClipWithIdentifier(v7);
    id v9 = iconPathForWebClipWithIdentifier(v7);
    id v10 = [MEMORY[0x263F08850] defaultManager];
    if (([v10 fileExistsAtPath:v8] & 1) == 0
      && ([v10 createDirectoryAtPath:v8 withIntermediateDirectories:0 attributes:0 error:a4] & 1) == 0)
    {
      v33 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[CPSWebClipStore _saveWebClip:error:].cold.5((uint64_t)a4, v33);
      }
      BOOL v30 = 0;
      goto LABEL_41;
    }
    uint64_t v11 = [NSURL fileURLWithPath:v8 isDirectory:1];
    if (([v11 setResourceValue:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFF6B0] error:a4] & 1) == 0)
    {
      v32 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[CPSWebClipStore _saveWebClip:error:].cold.4((uint64_t)a4, v32);
      }
      BOOL v30 = 0;
      goto LABEL_40;
    }
    v43 = v11;
    id v12 = [v8 stringByAppendingPathComponent:@"Info.plist"];
    id v13 = [v6 _dictionaryRepresentation];
    char v14 = [v13 writeToFile:v12 atomically:1];

    if (v14)
    {
      v42 = v9;
      uint64_t v15 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v39 = *MEMORY[0x263F080A8];
      uint64_t v50 = *MEMORY[0x263F080A8];
      uint64_t v38 = *MEMORY[0x263F080B0];
      v51[0] = *MEMORY[0x263F080B0];
      id v16 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
      id v45 = 0;
      v41 = v12;
      char v17 = [v15 setAttributes:v16 ofItemAtPath:v12 error:&v45];
      id v18 = v45;

      if ((v17 & 1) == 0)
      {
        long long v19 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          long long v20 = v19;
          long long v21 = objc_msgSend(v18, "cps_privacyPreservingDescription");
          *(_DWORD *)buf = 138543362;
          v49 = v21;
          _os_log_impl(&dword_21559C000, v20, OS_LOG_TYPE_INFO, "Couldn't change WebClip Info.plist's data protection class: %{public}@", buf, 0xCu);
        }
      }
      long long v22 = [v6 _temporaryIconPath];
      if (v22
        && (id v23 = [(CPSWebClipStore *)self _copyOrReplaceExistingFileAtPath:v42 withNewFileAtPath:v22], v23, !v23))
      {
        v35 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[CPSWebClipStore _saveWebClip:error:]();
        }
        id v9 = v42;
        if (a4)
        {
          objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 1);
          BOOL v30 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v30 = 0;
        }
      }
      else
      {
        long long v24 = [v6 iconImagePath];

        if (v24)
        {
          id v37 = v18;
          id v25 = v42;
          v26 = [MEMORY[0x263F08850] defaultManager];
          uint64_t v46 = v39;
          uint64_t v47 = v38;
          uint64_t v27 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
          id v44 = 0;
          v40 = v25;
          LOBYTE(v25) = [v26 setAttributes:v27 ofItemAtPath:v25 error:&v44];
          id v28 = v44;

          if ((v25 & 1) == 0)
          {
            v29 = CPS_LOG_CHANNEL_PREFIXClipServices();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              -[CPSWebClipStore _saveWebClip:error:](v29);
            }
          }

          id v18 = v37;
        }
        -[CPSWebClipStore _reloadSpringBoardIconForWebClipWithIdentifier:](self, "_reloadSpringBoardIconForWebClipWithIdentifier:", v7, v37);
        BOOL v30 = 1;
        id v9 = v42;
      }

      id v12 = v41;
      goto LABEL_39;
    }
    v34 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      -[CPSWebClipStore _saveWebClip:error:]();
      if (a4) {
        goto LABEL_29;
      }
    }
    else if (a4)
    {
LABEL_29:
      objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 1);
      BOOL v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:

      uint64_t v11 = v43;
LABEL_40:

LABEL_41:
      goto LABEL_42;
    }
    BOOL v30 = 0;
    goto LABEL_39;
  }
  v31 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    -[CPSWebClipStore _saveWebClip:error:].cold.6();
    if (a4) {
      goto LABEL_20;
    }
LABEL_31:
    BOOL v30 = 0;
    goto LABEL_42;
  }
  if (!a4) {
    goto LABEL_31;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 13);
  BOOL v30 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

  return v30;
}

- (void)updateWebClipTitle:(id)a3 forAppClipBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__CPSWebClipStore_updateWebClipTitle_forAppClipBundleIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_26424E9F0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

void __83__CPSWebClipStore_updateWebClipTitle_forAppClipBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [*(id *)(a1 + 32) _webClipsBackedbyAppClipIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v8 isPoweredBy] & 1) == 0)
        {
          id v9 = [v8 title];
          char v10 = [v9 isEqualToString:*(void *)(a1 + 48)];

          if ((v10 & 1) == 0) {
            [v8 setTitle:*(void *)(a1 + 48)];
          }
          uint64_t v11 = *(void **)(a1 + 32);
          id v14 = v5;
          [v11 _saveWebClip:v8 error:&v14];
          id v12 = v14;

          id v5 = v12;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  uint64_t v13 = *(void *)(a1 + 56);
  if (v13) {
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v5);
  }
}

- (void)updateAppClipIcon:(id)a3 forWebClipWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__CPSWebClipStore_updateAppClipIcon_forWebClipWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_26424E9F0;
  id v16 = v8;
  long long v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __80__CPSWebClipStore_updateAppClipIcon_forWebClipWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    uint64_t v3 = iconPathForWebClipWithIdentifier(*(void **)(a1 + 48));
    uint64_t v4 = [*(id *)(a1 + 32) path];
    [v2 _copyOrReplaceExistingFileAtPath:v3 withNewFileAtPath:v4];
  }
  [*(id *)(a1 + 40) _reloadSpringBoardIconForWebClipWithIdentifier:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }

  return MEMORY[0x270F9A758]();
}

- (void)removeAppClipIconForWebClipWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__CPSWebClipStore_removeAppClipIconForWebClipWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_26424E678;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __79__CPSWebClipStore_removeAppClipIconForWebClipWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = iconPathForWebClipWithIdentifier(*(void **)(a1 + 40));
  id v5 = [v2 _removeFileFromPath:v3];

  [*(id *)(a1 + 32) _reloadSpringBoardIconForWebClipWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (id)_copyOrReplaceExistingFileAtPath:(id)a3 withNewFileAtPath:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPSWebClipStore *)self _removeFileFromPath:v6];
  id v9 = [MEMORY[0x263F08850] defaultManager];
  id v15 = v8;
  [v9 copyItemAtPath:v7 toPath:v6 error:&v15];
  id v10 = v15;

  if (v10)
  {
    uint64_t v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = v11;
      id v14 = objc_msgSend(v10, "cps_privacyPreservingDescription");
      *(_DWORD *)buf = 138478339;
      id v17 = v7;
      __int16 v18 = 2113;
      id v19 = v6;
      __int16 v20 = 2114;
      long long v21 = v14;
      _os_log_error_impl(&dword_21559C000, v13, OS_LOG_TYPE_ERROR, "Could not copy icon from path %{private}@ to %{private}@: %{public}@", buf, 0x20u);
    }
  }

  return v10;
}

- (id)_removeFileFromPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v5 = [MEMORY[0x263F08850] defaultManager];
    id v9 = 0;
    [v5 removeItemAtPath:v3 error:&v9];
    id v6 = v9;

    if (v6)
    {
      id v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(CPSWebClipStore *)(uint64_t)v3 _removeFileFromPath:v6];
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)getAppClipWithIdentifier:(id)a3 receiveOnQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__CPSWebClipStore_getAppClipWithIdentifier_receiveOnQueue_completionHandler___block_invoke;
  block[3] = &unk_26424EC70;
  id v13 = v8;
  id v14 = v9;
  void block[4] = self;
  id v10 = v8;
  id v11 = v9;
  dispatch_async((dispatch_queue_t)a4, block);
}

void __77__CPSWebClipStore_getAppClipWithIdentifier_receiveOnQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) synchronouslyGetAppClipWithIdentifier:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)synchronouslyGetAppClipWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() _readWebClipDictionaryRepresentationFromDiskWithWebClipIdentifier:v3];
  if (v4)
  {
    id v5 = [[CPSWebClip alloc] _initWithIdentifier:v3 webClipDictionary:v4];
    if ([v5 webClipType] == 1) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)getAppClipWithURLHash:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CPSWebClipStore_getAppClipWithURLHash_completionHandler___block_invoke;
  block[3] = &unk_26424E678;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __59__CPSWebClipStore_getAppClipWithURLHash_completionHandler___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__CPSWebClipStore_getAppClipWithURLHash_completionHandler___block_invoke_2;
  v7[3] = &unk_26424EC98;
  id v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v3 = [v2 _enumerateAndFilterClipsWithBlock:v7];
  uint64_t v4 = [v3 count];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v4)
  {
    id v6 = [v3 firstObject];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

uint64_t __59__CPSWebClipStore_getAppClipWithURLHash_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 registeredURL];
  uint64_t v4 = [v3 absoluteString];
  uint64_t v5 = objc_msgSend(v4, "cps_sha256String");
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  return v6;
}

- (void)fetchBookmarkWebClipsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__CPSWebClipStore_fetchBookmarkWebClipsWithCompletionHandler___block_invoke;
    v7[3] = &unk_26424ECC0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __62__CPSWebClipStore_fetchBookmarkWebClipsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _bookmarkWebClips];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)fetchWebClipsUUIDStringForClientBundleID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__CPSWebClipStore_fetchWebClipsUUIDStringForClientBundleID_completionHandler___block_invoke;
    block[3] = &unk_26424E678;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

void __78__CPSWebClipStore_fetchWebClipsUUIDStringForClientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__CPSWebClipStore_fetchWebClipsUUIDStringForClientBundleID_completionHandler___block_invoke_2;
  v4[3] = &unk_26424ECE8;
  id v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _enumerateAndMapClipsWithBlock:v4];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id __78__CPSWebClipStore_fetchWebClipsUUIDStringForClientBundleID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(a1 + 32))
  {
    if ([v3 webClipType] != 1) {
      goto LABEL_9;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_11;
  }
  id v5 = [v3 trustedClientBundleIdentifiers];
  if ([v5 containsObject:*(void *)(a1 + 32)])
  {

LABEL_9:
    id v5 = [v4 uuid];
    id v6 = [v5 UUIDString];
    goto LABEL_10;
  }
  if (!*(void *)(a1 + 32))
  {
    uint64_t v7 = [v4 webClipType];

    if (v7 != 1) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_10:

LABEL_11:

  return v6;
}

- (void)fetchWebClipsURLStringForClientBundleID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__CPSWebClipStore_fetchWebClipsURLStringForClientBundleID_completionHandler___block_invoke;
    block[3] = &unk_26424E678;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

void __77__CPSWebClipStore_fetchWebClipsURLStringForClientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __77__CPSWebClipStore_fetchWebClipsURLStringForClientBundleID_completionHandler___block_invoke_2;
  v4[3] = &unk_26424ECE8;
  id v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _enumerateAndMapClipsWithBlock:v4];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id __77__CPSWebClipStore_fetchWebClipsURLStringForClientBundleID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(a1 + 32))
  {
    if ([v3 webClipType] != 1) {
      goto LABEL_9;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_11;
  }
  id v5 = [v3 trustedClientBundleIdentifiers];
  if ([v5 containsObject:*(void *)(a1 + 32)])
  {

LABEL_9:
    id v5 = [v4 pageURL];
    id v6 = [v5 absoluteString];
    goto LABEL_10;
  }
  if (!*(void *)(a1 + 32))
  {
    uint64_t v7 = [v4 webClipType];

    if (v7 != 1) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_10:

LABEL_11:

  return v6;
}

- (void)fetchAppClipsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__CPSWebClipStore_fetchAppClipsWithCompletionHandler___block_invoke;
    v7[3] = &unk_26424ECC0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __54__CPSWebClipStore_fetchAppClipsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _appClips];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_fetchInstalledAppClips
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__3;
  id v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__CPSWebClipStore__fetchInstalledAppClips__block_invoke;
  v5[3] = &unk_26424EC20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__CPSWebClipStore__fetchInstalledAppClips__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _appClips];
  uint64_t v2 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", &__block_literal_global_16);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __42__CPSWebClipStore__fetchInstalledAppClips__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isApplicationInstalled];
}

- (id)_bookmarkWebClips
{
  return [(CPSWebClipStore *)self _enumerateAndFilterClipsWithBlock:&__block_literal_global_18];
}

BOOL __36__CPSWebClipStore__bookmarkWebClips__block_invoke(uint64_t a1, void *a2)
{
  return [a2 webClipType] != 1;
}

- (id)_appClips
{
  return [(CPSWebClipStore *)self _enumerateAndFilterClipsWithBlock:&__block_literal_global_20];
}

BOOL __28__CPSWebClipStore__appClips__block_invoke(uint64_t a1, void *a2)
{
  return [a2 webClipType] == 1;
}

- (id)_enumerateAndFilterClipsWithBlock:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__CPSWebClipStore__enumerateAndFilterClipsWithBlock___block_invoke;
  v9[3] = &unk_26424ED30;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x2166BE5C0](v9);
  uint64_t v7 = [(CPSWebClipStore *)self _enumerateAndMapClipsWithBlock:v6];

  return v7;
}

id __53__CPSWebClipStore__enumerateAndFilterClipsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_enumerateAndMapClipsWithBlock:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v31 = (void (**)(id, id))a3;
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = (void *)MEMORY[0x2166BE3C0]();
  id v5 = webClipsDirectoryPath();
  uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  id v38 = 0;
  uint64_t v7 = [v6 contentsOfDirectoryAtPath:v5 error:&v38];
  id v8 = v38;
  if (v8)
  {
    id v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CPSWebClipStore _enumerateAndMapClipsWithBlock:](v9);
    }
    [v7 count];
    goto LABEL_5;
  }
  if (![v7 count])
  {
LABEL_5:
    id v10 = v3;

    goto LABEL_26;
  }
  context = v4;
  id v28 = v3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    v29 = v6;
    BOOL v30 = v5;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v16 = (void *)MEMORY[0x2166BE3C0]();
        id v17 = [v5 stringByAppendingPathComponent:v15];
        char v33 = 0;
        if ([v6 fileExistsAtPath:v17 isDirectory:&v33]) {
          BOOL v18 = v33 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          id v19 = [v15 stringByDeletingPathExtension];
          __int16 v20 = [v17 stringByAppendingPathComponent:@"Info.plist"];
          if (v19)
          {
            if ([v6 fileExistsAtPath:v20])
            {
              uint64_t v21 = [(id)objc_opt_class() _readWebClipDictionaryRepresentationFromDiskWithWebClipIdentifier:v19];
              if (v21)
              {
                uint64_t v22 = (void *)v21;
                id v23 = [[CPSWebClip alloc] _initWithIdentifier:v19 webClipDictionary:v21];
                long long v24 = v31[2](v31, v23);
                if (v24) {
                  [v28 addObject:v24];
                }

                uint64_t v6 = v29;
                id v5 = v30;
              }
            }
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v12);
  }

  id v3 = v28;
  id v25 = v28;
LABEL_26:

  return v3;
}

- (void)reloadSpringBoardIconForWebClipWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__CPSWebClipStore_reloadSpringBoardIconForWebClipWithIdentifier___block_invoke;
  v7[3] = &unk_26424E7D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __65__CPSWebClipStore_reloadSpringBoardIconForWebClipWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadSpringBoardIconForWebClipWithIdentifier:*(void *)(a1 + 40)];
}

- (void)_reloadSpringBoardIconForWebClipWithIdentifier:(id)a3
{
  if (a3) {
    objc_msgSend(MEMORY[0x263F79480], "updateWebClipPropertiesWithIdentifier:");
  }
}

- (void)createOrUpdateExistingWebClipWithMetadata:(id)a3 comletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__CPSWebClipStore_createOrUpdateExistingWebClipWithMetadata_comletionHandler___block_invoke;
  block[3] = &unk_26424E678;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __78__CPSWebClipStore_createOrUpdateExistingWebClipWithMetadata_comletionHandler___block_invoke(void *a1)
{
  unsigned __int8 v8 = 0;
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  id v4 = [v2 _createOrUpdateExistingWebClipWithClipMetadata:v3 createdNewWebClip:&v8 error:&v7];
  id v5 = v7;
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(uint64_t, void *, void, id))(v6 + 16))(v6, v4, v8, v5);
  }
}

- (id)_createOrUpdateExistingWebClipWithClipMetadata:(id)a3 createdNewWebClip:(BOOL *)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ([v7 hasFullAppInstalledOnSystem]) {
    [v7 fullAppBundleID];
  }
  else {
  unsigned __int8 v8 = [v7 clipBundleID];
  }
  char v33 = [v7 clipURL];
  *a4 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = [(CPSWebClipStore *)self _appClips];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (!v10)
  {

LABEL_28:
    id v13 = [[CPSWebClip alloc] _init];
    *a4 = 1;
    goto LABEL_29;
  }
  uint64_t v12 = v10;
  BOOL v30 = a4;
  v31 = a5;
  id v13 = 0;
  uint64_t v14 = *(void *)v36;
  *(void *)&long long v11 = 138478083;
  long long v29 = v11;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v36 != v14) {
        objc_enumerationMutation(v9);
      }
      id v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      id v17 = objc_msgSend(v16, "applicationBundleIdentifier", v29);
      int v18 = [v17 isEqualToString:v8];

      if (v18)
      {
        if ([v7 isPoweredByThirdParty] & 1) != 0 || (objc_msgSend(v16, "isPoweredBy"))
        {
          if (!v13)
          {
            id v19 = [v16 registeredURL];
            if (v19 == v33)
            {
              __int16 v20 = v33;
LABEL_26:
              id v13 = v16;

              goto LABEL_27;
            }
            __int16 v20 = v19;
            if (objc_msgSend(v19, "isEqual:")) {
              goto LABEL_26;
            }

            id v13 = 0;
          }
        }
        else if (v13)
        {
          uint64_t v21 = [v16 identifier];
          id v34 = 0;
          [(CPSWebClipStore *)self _removeWebClipWithIdentifier:v21 error:&v34];
          id v22 = v34;

          id v23 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            long long v24 = v23;
            id v25 = objc_msgSend(v22, "cps_privacyPreservingDescription");
            *(_DWORD *)buf = v29;
            uint64_t v40 = v8;
            __int16 v41 = 2114;
            v42 = v25;
            _os_log_error_impl(&dword_21559C000, v24, OS_LOG_TYPE_ERROR, "Removed duplicate web clip for %{private}@, error: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          id v13 = v16;
        }
      }
    }
    uint64_t v12 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v12) {
      continue;
    }
    break;
  }
LABEL_27:

  a4 = v30;
  a5 = v31;
  if (!v13) {
    goto LABEL_28;
  }
LABEL_29:
  [v13 _updateWithClipMetadata:v7];
  if ([(CPSWebClipStore *)self _saveWebClip:v13 error:a5])
  {
    id v26 = v13;
  }
  else
  {
    uint64_t v27 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[CPSWebClipStore _createOrUpdateExistingWebClipWithClipMetadata:createdNewWebClip:error:]();
    }
    id v26 = 0;
  }

  return v26;
}

- (void)getWebClipWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CPSWebClipStore_getWebClipWithURL_completionHandler___block_invoke;
  block[3] = &unk_26424E678;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __55__CPSWebClipStore_getWebClipWithURL_completionHandler___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__CPSWebClipStore_getWebClipWithURL_completionHandler___block_invoke_2;
  v6[3] = &unk_26424EC98;
  uint64_t v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 _enumerateAndFilterClipsWithBlock:v6];
  uint64_t v4 = *(void *)(a1 + 48);
  if ([v3 count])
  {
    id v5 = [v3 firstObject];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

uint64_t __55__CPSWebClipStore_getWebClipWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 pageURL];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)getWebClipDictionaryWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __72__CPSWebClipStore_getWebClipDictionaryWithIdentifier_completionHandler___block_invoke;
    v9[3] = &unk_26424E6F0;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, v9);
  }
}

void __72__CPSWebClipStore_getWebClipDictionaryWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) UUIDString];
  id v15 = [v2 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26C629F40];

  uint64_t v3 = pathForWebClipWithIdentifier(v15);
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"Info.plist"];
  if (!v15) {
    goto LABEL_7;
  }
  id v5 = [MEMORY[0x263F08850] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4];

  if (!v6) {
    goto LABEL_7;
  }
  id v7 = [NSDictionary dictionaryWithContentsOfFile:v4];
  unsigned __int8 v8 = (void *)[v7 mutableCopy];

  if (v8)
  {
    [v8 setObject:v15 forKeyedSubscript:@"DictionaryRepresentationIdentifier"];
    id v9 = [v3 stringByAppendingPathComponent:@"ApplicationManifest"];
    id v10 = [MEMORY[0x263F08850] defaultManager];
    int v11 = [v10 fileExistsAtPath:v9];

    if (v11)
    {
      id v12 = (void *)MEMORY[0x263EFF8F8];
      id v13 = [NSURL fileURLWithPath:v9 isDirectory:0];
      uint64_t v14 = [v12 dataWithContentsOfURL:v13];

      [v8 setObject:v14 forKeyedSubscript:@"DictionaryRepresentationManifest"];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getWebClipsBackedbyAppClipIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CPSWebClipStore_getWebClipsBackedbyAppClipIdentifier_completion___block_invoke;
  block[3] = &unk_26424EC70;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __67__CPSWebClipStore_getWebClipsBackedbyAppClipIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) _webClipsBackedbyAppClipIdentifier:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_webClipsBackedbyAppClipIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(CPSWebClipStore *)self _appClips];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 applicationBundleIdentifier];
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)purgeDuplicateWebClipsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__CPSWebClipStore_purgeDuplicateWebClipsWithCompletionHandler___block_invoke;
  v7[3] = &unk_26424E6F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__CPSWebClipStore_purgeDuplicateWebClipsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) _appClips];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v8 isPoweredBy] & 1) == 0)
        {
          uint64_t v9 = [v8 applicationBundleIdentifier];
          if (v9)
          {
            id v10 = [v2 objectForKeyedSubscript:v9];

            if (!v10)
            {
              int v11 = [MEMORY[0x263EFF980] array];
              [v2 setObject:v11 forKeyedSubscript:v9];
            }
            id v12 = [v2 objectForKeyedSubscript:v9];
            [v12 addObject:v8];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__CPSWebClipStore_purgeDuplicateWebClipsWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_26424ED58;
  v13[4] = *(void *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v13];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63__CPSWebClipStore_purgeDuplicateWebClipsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ((unint64_t)[v6 count] >= 2)
  {
    [v6 removeObjectAtIndex:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v18 = v6;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(a1 + 32);
          int v13 = [*(id *)(*((void *)&v20 + 1) + 8 * v11) identifier];
          id v19 = 0;
          [v12 _removeWebClipWithIdentifier:v13 error:&v19];
          id v14 = v19;

          long long v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            long long v16 = v15;
            long long v17 = objc_msgSend(v14, "cps_privacyPreservingDescription");
            *(_DWORD *)buf = 138478083;
            id v25 = v5;
            __int16 v26 = 2114;
            uint64_t v27 = v17;
            _os_log_error_impl(&dword_21559C000, v16, OS_LOG_TYPE_ERROR, "Removed duplicate web clip for %{private}@, error: %{public}@", buf, 0x16u);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v9);
    }

    id v6 = v18;
  }
}

- (void)removePoweredByWebClipsLastActivatedBefore:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__CPSWebClipStore_removePoweredByWebClipsLastActivatedBefore_completion___block_invoke;
  block[3] = &unk_26424E678;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __73__CPSWebClipStore_removePoweredByWebClipsLastActivatedBefore_completion___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v34 = v3;
    _os_log_impl(&dword_21559C000, v2, OS_LOG_TYPE_DEFAULT, "Removing powered by web clips last activated before: %@", buf, 0xCu);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v4 = [*(id *)(a1 + 40) _appClips];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v30;
    *(void *)&long long v6 = 138412546;
    long long v27 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "lastActivatedTime", v27);

        if (!v11)
        {
          id v21 = [MEMORY[0x263EFF910] now];
          [v10 setLastActivatedTime:v21];
LABEL_17:

          continue;
        }
        if ([v10 isPoweredBy])
        {
          id v12 = [v10 lastActivatedTime];
          uint64_t v13 = [v12 compare:*(void *)(a1 + 32)];

          if (v13 == -1)
          {
            id v14 = CPS_LOG_CHANNEL_PREFIXClipServices();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              long long v15 = v14;
              long long v16 = [v10 identifier];
              long long v17 = [v10 lastActivatedTime];
              *(_DWORD *)buf = v27;
              id v34 = v16;
              __int16 v35 = 2112;
              long long v36 = v17;
              _os_log_impl(&dword_21559C000, v15, OS_LOG_TYPE_DEFAULT, "Removing web clip with identifier: %@ lastActivatedTime: %@", buf, 0x16u);
            }
            id v18 = *(void **)(a1 + 40);
            id v19 = [v10 identifier];
            id v28 = 0;
            char v20 = [v18 _removeWebClipWithIdentifier:v19 error:&v28];
            id v21 = v28;

            if ((v20 & 1) == 0)
            {
              long long v22 = CPS_LOG_CHANNEL_PREFIXClipServices();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                long long v23 = v22;
                long long v24 = [v10 identifier];
                id v25 = [v21 localizedDescription];
                *(_DWORD *)buf = v27;
                id v34 = v24;
                __int16 v35 = 2112;
                long long v36 = v25;
                _os_log_error_impl(&dword_21559C000, v23, OS_LOG_TYPE_ERROR, "Unable to remove expired web clip with identifier: %@ error: %@", buf, 0x16u);
              }
            }
            goto LABEL_17;
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v7);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)removeExpiredPoweredByWebClipsWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  long long v6 = [v4 currentCalendar];
  uint64_t v7 = [MEMORY[0x263EFF910] now];
  id v8 = [v6 dateByAddingUnit:16 value:-10 toDate:v7 options:0];

  [(CPSWebClipStore *)self removePoweredByWebClipsLastActivatedBefore:v8 completion:v5];
}

- (void).cxx_destruct
{
}

- (void)_removeWebClipWithIdentifier:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21559C000, a2, OS_LOG_TYPE_ERROR, "Unable to remove web clip to Home Screen %d", (uint8_t *)v2, 8u);
}

- (void)_saveWebClip:(void *)a1 error:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "Couldn't change WebClip icon's data protection class: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_saveWebClip:error:.cold.2()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_0(&dword_21559C000, v0, v1, "Could not save WebClip icon", v2, v3, v4, v5, v6);
}

- (void)_saveWebClip:error:.cold.3()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_0(&dword_21559C000, v0, v1, "Couldn't save WebClip Info.plist", v2, v3, v4, v5, v6);
}

- (void)_saveWebClip:(uint64_t)a1 error:(void *)a2 .cold.4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v5, v6, "Couldn't exclude WebClip from backup: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_saveWebClip:(uint64_t)a1 error:(void *)a2 .cold.5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v5, v6, "Couldn't create WebClip bundle: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_saveWebClip:error:.cold.6()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_0(&dword_21559C000, v0, v1, "CPSWebClipStore doesn't support writing traditional web clips to disk. Attempting to do so may result in data loss. Use -[UIWebClip createOnDisk] from <UIKit/UIWebClip.h> instead.", v2, v3, v4, v5, v6);
}

- (void)_removeFileFromPath:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint8_t v6 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  int v7 = 138478083;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_21559C000, v5, OS_LOG_TYPE_ERROR, "Could not remove existing icon from path %{private}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_enumerateAndMapClipsWithBlock:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "Unable to retrieve contents of the web clip directory: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_createOrUpdateExistingWebClipWithClipMetadata:createdNewWebClip:error:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_0(&dword_21559C000, v0, v1, "Unable to update matched web clip on disk", v2, v3, v4, v5, v6);
}

@end