@interface FBKFileCollector
+ (id)diskAccessQueue;
+ (void)findExistingFilesForFilerForm:(id)a3 matcherPredicates:(id)a4 completion:(id)a5;
- (BOOL)hasFilePromises;
- (BOOL)hasUnmetRequirements;
- (FBKAttachmentListenerDelegate)listener;
- (FBKDECollector)deCollector;
- (FBKFileCollector)initWithFilerForm:(id)a3 attachmentDescriptors:(id)a4;
- (FBKFilerForm)filerForm;
- (NSArray)attachmentDescriptors;
- (NSMutableSet)_attachments;
- (NSURL)submissionDir;
- (id)_fileProcessingQueue;
- (id)attachDraftFiles:(id)a3 withRequirements:(id)a4;
- (id)attachLocalFiles:(id)a3 withRequirements:(id)a4 shouldCopyFiles:(BOOL)a5;
- (id)attachURLSchemeFiles:(id)a3 withRequirements:(id)a4;
- (id)attachments;
- (id)currentDeviceIdentifier;
- (id)diagnosticExtensionAttachments;
- (id)diskAccessQueue;
- (id)existingAttachmentRegexMatchingFile:(id)a3;
- (id)getUniqueFileNameForAttachmentType:(int64_t)a3;
- (id)identifier;
- (id)newAttachmentWithType:(int64_t)a3;
- (id)platform;
- (id)requirements;
- (void)_addAttachment:(id)a3;
- (void)_attachURL:(id)a3 toAttachment:(id)a4;
- (void)_removeAttachment:(id)a3;
- (void)_updateAttachment:(id)a3 withState:(int64_t)a4;
- (void)addAttachmentWithItemProvider:(id)a3;
- (void)addFileFromItemProvider:(id)a3;
- (void)addFileFromURL:(id)a3 byMoving:(BOOL)a4;
- (void)addImageWithItemProvider:(id)a3;
- (void)addVideoFromItemProvider:(id)a3;
- (void)cancelCollection:(id)a3;
- (void)commitWithForm:(id)a3 withCompletion:(id)a4;
- (void)processFileFromURL:(id)a3 movingFile:(BOOL)a4 forAttachment:(id)a5;
- (void)removeAllAttachments;
- (void)removeAttachment:(id)a3;
- (void)reportAttachingErrorWithAttachment:(id)a3 userFriendlyError:(id)a4;
- (void)saveDraftsDirectory;
- (void)setAttachmentDescriptors:(id)a3;
- (void)setDeCollector:(id)a3;
- (void)setFilerForm:(id)a3;
- (void)setListener:(id)a3;
- (void)setSubmissionDir:(id)a3;
- (void)set_attachments:(id)a3;
- (void)submissionDir;
- (void)updateRequirements:(id)a3;
@end

@implementation FBKFileCollector

- (FBKFileCollector)initWithFilerForm:(id)a3 attachmentDescriptors:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FBKFileCollector;
  v9 = [(FBKFileCollector *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_filerForm, a3);
    objc_storeStrong((id *)&v10->_attachmentDescriptors, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:3];
    attachments = v10->__attachments;
    v10->__attachments = (NSMutableSet *)v11;

    BOOL v13 = +[FBKSharedConstants usesTemporaryDraftsDirectory];
    v14 = [(FBKFileCollector *)v10 filerForm];
    if (v13) {
      +[FBKFileManager temporaryDraftDirectoryForFilerForm:v14];
    }
    else {
    uint64_t v15 = +[FBKFileManager draftDirectoryForFilerForm:v14];
    }
    submissionDir = v10->_submissionDir;
    v10->_submissionDir = (NSURL *)v15;
  }
  return v10;
}

- (id)currentDeviceIdentifier
{
  v2 = +[FBKDeviceManager sharedInstance];
  v3 = [v2 thisDevice];
  v4 = [v3 identifier];

  return v4;
}

- (id)attachDraftFiles:(id)a3 withRequirements:(id)a4
{
  return [(FBKFileCollector *)self attachLocalFiles:a3 withRequirements:a4 shouldCopyFiles:0];
}

- (id)attachURLSchemeFiles:(id)a3 withRequirements:(id)a4
{
  return [(FBKFileCollector *)self attachLocalFiles:a3 withRequirements:a4 shouldCopyFiles:1];
}

- (id)attachLocalFiles:(id)a3 withRequirements:(id)a4 shouldCopyFiles:(BOOL)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc(MEMORY[0x263EFF980]);
  v10 = [v8 allObjects];
  uint64_t v11 = (void *)[v9 initWithArray:v10];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v34 = v7;
  id obj = [v7 allKeys];
  uint64_t v12 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v32 = *(void *)v41;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v41 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
        v16 = +[FBKLog attachHandle];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v45 = v15;
          _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_DEFAULT, "will create attachment for URL attached file with identifier [%{public}@]", buf, 0xCu);
        }

        v17 = [FBKAttachment alloc];
        objc_super v18 = [(FBKFileCollector *)self identifier];
        v19 = [(FBKFileCollector *)self currentDeviceIdentifier];
        v20 = [(FBKAttachment *)v17 initWithCollectorIdentifier:v18 deviceUUID:v19];

        [(FBKAttachment *)v20 setAttachmentType:5];
        [(FBKAttachment *)v20 setFileComesFromFBK:1];
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __70__FBKFileCollector_attachLocalFiles_withRequirements_shouldCopyFiles___block_invoke;
        v39[3] = &unk_264875188;
        v39[4] = v15;
        v21 = objc_msgSend(v11, "ded_findWithBlock:", v39);
        if (v21)
        {
          v22 = +[FBKLog attachHandle];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v30 = [v21 deBundleIdentifier];
            v26 = [v34 objectForKeyedSubscript:v30];
            v29 = [v21 deBundleIdentifier];
            *(_DWORD *)buf = 138543618;
            v45 = v26;
            __int16 v46 = 2114;
            v47 = v29;
            _os_log_debug_impl(&dword_22A36D000, v22, OS_LOG_TYPE_DEBUG, "Found pending match [%{public}@] for requirement [%{public}@]", buf, 0x16u);
          }
          [(FBKAttachment *)v20 setAttachmentType:1];
          [(FBKAttachment *)v20 setRequirement:v21];
          [v11 removeObject:v21];
        }
        v23 = [v34 objectForKeyedSubscript:v15];
        [(FBKAttachment *)v20 setState:1];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __70__FBKFileCollector_attachLocalFiles_withRequirements_shouldCopyFiles___block_invoke_47;
        block[3] = &unk_2648751B0;
        BOOL v38 = a5;
        block[4] = self;
        id v36 = v23;
        v37 = v20;
        v24 = v20;
        id v25 = v23;
        dispatch_async(MEMORY[0x263EF83A0], block);

        ++v14;
      }
      while (v13 != v14);
      uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v13);
  }

  v27 = [MEMORY[0x263EFFA08] setWithArray:v11];

  return v27;
}

uint64_t __70__FBKFileCollector_attachLocalFiles_withRequirements_shouldCopyFiles___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 deBundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __70__FBKFileCollector_attachLocalFiles_withRequirements_shouldCopyFiles___block_invoke_47(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) _attachURL:*(void *)(a1 + 40) toAttachment:*(void *)(a1 + 48)];
    uint64_t v2 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 32) attachmentDescriptors];
    v3 = +[FBKAttachment descriptorForAttachment:given:](FBKAttachment, "descriptorForAttachment:given:", v2);
    uint64_t v4 = [v3 localizedDescription];
    [*(id *)(a1 + 48) setLocalizedAttachmentInfo:v4];
  }
  else
  {
    id v9 = [MEMORY[0x263F3A120] itemWithURL:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 48), "setItem:originalURL:");
    uint64_t v5 = *(void *)(a1 + 48);
    v6 = [*(id *)(a1 + 32) attachmentDescriptors];
    id v7 = +[FBKAttachment descriptorForAttachment:v5 given:v6];
    id v8 = [v7 localizedDescription];
    [*(id *)(a1 + 48) setLocalizedAttachmentInfo:v8];

    [*(id *)(a1 + 48) setState:2];
    [*(id *)(a1 + 32) _addAttachment:*(void *)(a1 + 48)];
  }
}

+ (void)findExistingFilesForFilerForm:(id)a3 matcherPredicates:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = +[FBKFileManager draftDirectoryForFilerForm:a3];
  uint64_t v11 = [a1 diskAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__FBKFileCollector_findExistingFilesForFilerForm_matcherPredicates_completion___block_invoke;
  block[3] = &unk_264874388;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_sync(v11, block);
}

void __79__FBKFileCollector_findExistingFilesForFilerForm_matcherPredicates_completion___block_invoke(uint64_t a1)
{
  v1 = (id *)a1;
  uint64_t v51 = *MEMORY[0x263EF8340];
  v34 = [MEMORY[0x263EFF9C0] setWithSet:*(void *)(a1 + 32)];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  v3 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = [v1[5] path];
  char v5 = [v3 fileExistsAtPath:v4 isDirectory:0];

  if (v5)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v44 = 0u;
    long long v43 = 0u;
    v6 = [MEMORY[0x263F3A0A0] lsDir:v1[5]];
    uint64_t v32 = [v6 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v32)
    {
      uint64_t v30 = *(void *)v44;
      v31 = v1;
      id obj = v6;
      do
      {
        uint64_t v7 = 0;
        do
        {
          id v8 = v2;
          if (*(void *)v44 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = v7;
          id v9 = *(void **)(*((void *)&v43 + 1) + 8 * v7);
          v10 = [v9 lastPathComponent];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v11 = v1[4];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v40 != v14) {
                  objc_enumerationMutation(v11);
                }
                id v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                id v17 = [v16 fileMatcher];
                int v18 = [v17 matchesFilename:v10];

                if (v18)
                {
                  [v34 removeObject:v16];
                  v19 = [v16 deBundleIdentifier];
                  [v8 setObject:v9 forKeyedSubscript:v19];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v13);
          }

          uint64_t v2 = v8;
          v20 = [v8 allValues];
          char v21 = [v20 containsObject:v9];

          if ((v21 & 1) == 0)
          {
            v22 = [v9 path];
            [v8 setObject:v9 forKeyedSubscript:v22];
          }
          uint64_t v7 = v33 + 1;
          v1 = v31;
        }
        while (v33 + 1 != v32);
        v6 = obj;
        uint64_t v32 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v32);
    }
  }
  else
  {
    v6 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v23 = v1[5];
      *(_DWORD *)buf = 138543362;
      id v50 = v23;
      _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_INFO, "Drafts directory does not exist yet [%{public}@]", buf, 0xCu);
    }
  }

  if ([v2 count])
  {
    v24 = [NSDictionary dictionaryWithDictionary:v2];
  }
  else
  {
    v24 = 0;
  }
  id v25 = [MEMORY[0x263EFFA08] setWithSet:v34];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__FBKFileCollector_findExistingFilesForFilerForm_matcherPredicates_completion___block_invoke_55;
  block[3] = &unk_264874450;
  id v26 = v1[6];
  id v37 = v25;
  id v38 = v26;
  id v36 = v24;
  id v27 = v25;
  id v28 = v24;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __79__FBKFileCollector_findExistingFilesForFilerForm_matcherPredicates_completion___block_invoke_55(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)addAttachmentWithItemProvider:(id)a3
{
  id v4 = a3;
  char v5 = [(id)*MEMORY[0x263F1DBC8] identifier];
  int v6 = [v4 hasItemConformingToTypeIdentifier:v5];

  if (v6)
  {
    [(FBKFileCollector *)self addVideoFromItemProvider:v4];
  }
  else if ([v4 canLoadObjectOfClass:objc_opt_class()])
  {
    [(FBKFileCollector *)self addImageWithItemProvider:v4];
  }
  else
  {
    uint64_t v7 = [(id)*MEMORY[0x263F1DB38] identifier];
    int v8 = [v4 hasItemConformingToTypeIdentifier:v7];

    if (v8)
    {
      [(FBKFileCollector *)self addFileFromItemProvider:v4];
    }
    else
    {
      id v9 = +[FBKLog attachHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[FBKFileCollector addAttachmentWithItemProvider:]();
      }
    }
  }
}

- (id)diskAccessQueue
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 diskAccessQueue];
}

+ (id)diskAccessQueue
{
  if (diskAccessQueue_onceToken != -1) {
    dispatch_once(&diskAccessQueue_onceToken, &__block_literal_global_18);
  }
  uint64_t v2 = (void *)diskAccessQueue_imageProcessingQueue;

  return v2;
}

uint64_t __35__FBKFileCollector_diskAccessQueue__block_invoke()
{
  diskAccessQueue_imageProcessingQueue = (uint64_t)dispatch_queue_create("com.apple.appleseed.FeedbackAssistant.diskAccess", 0);

  return MEMORY[0x270F9A758]();
}

- (void)addImageWithItemProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKFileCollector *)self newAttachmentWithType:3];
  int v6 = [(FBKFileCollector *)self submissionDir];
  uint64_t v7 = [v5 proposedFileNameForLocalFiles];
  int v8 = [v6 URLByAppendingPathComponent:v7];

  [(FBKFileCollector *)self _addAttachment:v5];
  id v9 = [(FBKFileCollector *)self listener];
  [v9 attachmentProvider:self didStartAttaching:v5];

  uint64_t v10 = objc_opt_class();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__FBKFileCollector_addImageWithItemProvider___block_invoke;
  v14[3] = &unk_264875200;
  v14[4] = self;
  id v15 = v5;
  id v16 = v8;
  id v11 = v8;
  id v12 = v5;
  id v13 = (id)[v4 loadObjectOfClass:v10 completionHandler:v14];
}

void __45__FBKFileCollector_addImageWithItemProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && !v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = v5;
    id v9 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v10;
      _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "Will add image [%{public}@]", buf, 0xCu);
    }

    id v11 = [v8 correctlyRotatedPNGData];
    id v12 = v11;
    if (v11 && [v11 writeToURL:*(void *)(a1 + 48) atomically:1])
    {
      id v13 = +[FBKLog attachHandle];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        uint64_t v38 = v14;
        _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_DEFAULT, "Did add image [%{public}@]", buf, 0xCu);
      }

      id v15 = [MEMORY[0x263F3A120] itemWithURL:*(void *)(a1 + 48)];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __45__FBKFileCollector_addImageWithItemProvider___block_invoke_62;
      block[3] = &unk_2648751D8;
      id v30 = *(id *)(a1 + 40);
      id v31 = v15;
      id v16 = *(id *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 32);
      id v32 = v16;
      uint64_t v33 = v17;
      id v18 = v15;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __45__FBKFileCollector_addImageWithItemProvider___block_invoke_2;
      v25[3] = &unk_264874EC8;
      id v22 = *(id *)(a1 + 48);
      uint64_t v23 = *(void *)(a1 + 32);
      v24 = *(void **)(a1 + 40);
      id v26 = v22;
      uint64_t v27 = v23;
      id v28 = v24;
      dispatch_async(MEMORY[0x263EF83A0], v25);

      id v18 = v26;
    }
  }
  else
  {
    v19 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __45__FBKFileCollector_addImageWithItemProvider___block_invoke_cold_1(v7, v19);
    }

    v20 = FBKErrorOfType(-1018);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __45__FBKFileCollector_addImageWithItemProvider___block_invoke_61;
    v34[3] = &unk_264874EC8;
    char v21 = *(void **)(a1 + 40);
    v34[4] = *(void *)(a1 + 32);
    id v35 = v21;
    id v36 = v20;
    id v8 = v20;
    dispatch_async(MEMORY[0x263EF83A0], v34);
  }
}

void __45__FBKFileCollector_addImageWithItemProvider___block_invoke_61(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAttachment:*(void *)(a1 + 40) withState:3];
  id v2 = [*(id *)(a1 + 32) listener];
  [v2 attachmentProvider:*(void *)(a1 + 32) didFinishAttaching:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void __45__FBKFileCollector_addImageWithItemProvider___block_invoke_62(uint64_t a1)
{
  [*(id *)(a1 + 32) setItem:*(void *)(a1 + 40) originalURL:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 56) attachmentDescriptors];
  id v4 = +[FBKAttachment descriptorForAttachment:v2 given:v3];
  id v5 = [v4 localizedDescription];
  [*(id *)(a1 + 32) setLocalizedAttachmentInfo:v5];

  [*(id *)(a1 + 56) _updateAttachment:*(void *)(a1 + 32) withState:2];
  id v6 = [*(id *)(a1 + 56) listener];
  [v6 attachmentProvider:*(void *)(a1 + 56) didFinishAttaching:*(void *)(a1 + 32) error:0];
}

void __45__FBKFileCollector_addImageWithItemProvider___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[FBKLog attachHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__FBKFileCollector_addImageWithItemProvider___block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 40) _updateAttachment:*(void *)(a1 + 48) withState:3];
  v3 = [*(id *)(a1 + 40) listener];
  [v3 attachmentProvider:*(void *)(a1 + 40) didFinishAttaching:*(void *)(a1 + 48) error:0];
}

- (void)addVideoFromItemProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKFileCollector *)self newAttachmentWithType:4];
  id v6 = [(FBKFileCollector *)self submissionDir];
  uint64_t v7 = [v5 proposedFileNameForLocalFiles];
  id v8 = [v6 URLByAppendingPathComponent:v7];

  [(FBKFileCollector *)self _addAttachment:v5];
  id v9 = [(FBKFileCollector *)self listener];
  [v9 attachmentProvider:self didStartAttaching:v5];

  uint64_t v10 = [(id)*MEMORY[0x263F1DBC8] identifier];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__FBKFileCollector_addVideoFromItemProvider___block_invoke;
  v14[3] = &unk_264875228;
  v14[4] = self;
  id v15 = v5;
  id v16 = v8;
  id v11 = v8;
  id v12 = v5;
  id v13 = (id)[v4 loadFileRepresentationForTypeIdentifier:v10 completionHandler:v14];
}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[FBKLog attachHandle];
  id v8 = v7;
  if (v5 && !v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      id v40 = v5;
      __int16 v41 = 2114;
      uint64_t v42 = v9;
      _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "Will copy video url [%{public}@] to [%{public}@] ", buf, 0x16u);
    }

    uint64_t v10 = [MEMORY[0x263F08850] defaultManager];
    id v11 = [v5 path];
    int v12 = [v10 isReadableFileAtPath:v11];

    if (v12)
    {
      id v13 = (void *)MEMORY[0x263F3A0A0];
      uint64_t v14 = [*(id *)(a1 + 32) submissionDir];
      id v15 = [v13 copyAndReturn:v5 toDir:v14];

      if (v15)
      {
        id v16 = [MEMORY[0x263F08850] defaultManager];
        uint64_t v17 = *(void *)(a1 + 48);
        id v35 = 0;
        [v16 moveItemAtURL:v15 toURL:v17 error:&v35];
        id v18 = v35;
        if (!v18)
        {
          v24 = [MEMORY[0x263F3A120] itemWithURL:*(void *)(a1 + 48)];
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_65;
          v30[3] = &unk_2648751D8;
          id v31 = *(id *)(a1 + 40);
          id v32 = v24;
          id v25 = v5;
          uint64_t v26 = *(void *)(a1 + 32);
          id v33 = v25;
          uint64_t v34 = v26;
          id v27 = v24;
          dispatch_async(MEMORY[0x263EF83A0], v30);

          goto LABEL_20;
        }
        v19 = v18;
        v20 = +[FBKLog attachHandle];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_2();
        }

        goto LABEL_19;
      }
      id v15 = +[FBKLog attachHandle];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_1((uint64_t)v5, (id *)(a1 + 32), v15);
      }
    }
    else
    {
      id v15 = +[FBKLog attachHandle];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_3();
      }
    }
    v19 = 0;
LABEL_19:

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_66;
    v28[3] = &unk_264874270;
    uint64_t v23 = *(void **)(a1 + 40);
    v28[4] = *(void *)(a1 + 32);
    id v29 = v23;
    dispatch_async(MEMORY[0x263EF83A0], v28);

    id v15 = v19;
    goto LABEL_20;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_4(v6, v8);
  }

  char v21 = FBKErrorOfType(-1017);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_64;
  block[3] = &unk_264874EC8;
  id v22 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v37 = v22;
  id v38 = v21;
  id v15 = v21;
  dispatch_async(MEMORY[0x263EF83A0], block);

LABEL_20:
}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_64(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAttachment:*(void *)(a1 + 40) withState:3];
  id v2 = [*(id *)(a1 + 32) listener];
  [v2 attachmentProvider:*(void *)(a1 + 32) didFinishAttaching:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_65(uint64_t a1)
{
  [*(id *)(a1 + 32) setItem:*(void *)(a1 + 40) originalURL:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 56) attachmentDescriptors];
  id v4 = +[FBKAttachment descriptorForAttachment:v2 given:v3];
  id v5 = [v4 localizedDescription];
  [*(id *)(a1 + 32) setLocalizedAttachmentInfo:v5];

  [*(id *)(a1 + 56) _updateAttachment:*(void *)(a1 + 32) withState:2];
  id v6 = [*(id *)(a1 + 56) listener];
  [v6 attachmentProvider:*(void *)(a1 + 56) didFinishAttaching:*(void *)(a1 + 32) error:0];
}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_66(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAttachment:*(void *)(a1 + 40) withState:3];
  FBKErrorOfType(-1017);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(a1 + 32) listener];
  [v2 attachmentProvider:*(void *)(a1 + 32) didFinishAttaching:*(void *)(a1 + 40) error:v3];
}

- (id)newAttachmentWithType:(int64_t)a3
{
  id v5 = [FBKAttachment alloc];
  id v6 = [(FBKFileCollector *)self identifier];
  uint64_t v7 = [(FBKFileCollector *)self currentDeviceIdentifier];
  id v8 = [(FBKAttachment *)v5 initWithCollectorIdentifier:v6 deviceUUID:v7];

  [(FBKAttachment *)v8 setAttachmentType:a3];
  [(FBKAttachment *)v8 setState:1];
  [(FBKAttachment *)v8 setFileComesFromFBK:1];
  uint64_t v9 = [(FBKFileCollector *)self getUniqueFileNameForAttachmentType:[(FBKAttachment *)v8 attachmentType]];
  [(FBKAttachment *)v8 setProposedFileNameForLocalFiles:v9];

  return v8;
}

- (id)_fileProcessingQueue
{
  if (_fileProcessingQueue_onceToken != -1) {
    dispatch_once(&_fileProcessingQueue_onceToken, &__block_literal_global_69);
  }
  uint64_t v2 = (void *)_fileProcessingQueue_fileProcessingQueue;

  return v2;
}

uint64_t __40__FBKFileCollector__fileProcessingQueue__block_invoke()
{
  _fileProcessingQueue_fileProcessingQueue = (uint64_t)dispatch_queue_create("com.apple.appleseed.FeedbackAssistant.FileProcessing", 0);

  return MEMORY[0x270F9A758]();
}

- (void)addFileFromItemProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKFileCollector *)self newAttachmentWithType:5];
  id v6 = [(FBKFileCollector *)self listener];
  [v6 attachmentProvider:self didStartAttaching:v5];

  uint64_t v7 = [(id)*MEMORY[0x263F1DB38] identifier];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__FBKFileCollector_addFileFromItemProvider___block_invoke;
  v10[3] = &unk_264875250;
  id v11 = v5;
  int v12 = self;
  id v8 = v5;
  id v9 = (id)[v4 loadFileRepresentationForTypeIdentifier:v7 completionHandler:v10];
}

void __44__FBKFileCollector_addFileFromItemProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__FBKFileCollector_addFileFromItemProvider___block_invoke_2;
  block[3] = &unk_264874EC8;
  id v16 = *(id *)(a1 + 32);
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 40);
  id v17 = v7;
  uint64_t v18 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
  if (!v7 || v6)
  {
    id v9 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __44__FBKFileCollector_addFileFromItemProvider___block_invoke_cold_1(v6, v9);
    }

    uint64_t v10 = [MEMORY[0x263F08A48] mainQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __44__FBKFileCollector_addFileFromItemProvider___block_invoke_72;
    v13[3] = &unk_264874270;
    int8x16_t v12 = *(int8x16_t *)(a1 + 32);
    id v11 = (id)v12.i64[0];
    int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
    [v10 addOperationWithBlock:v13];
  }
  else
  {
    [*(id *)(a1 + 40) processFileFromURL:v7 movingFile:0 forAttachment:*(void *)(a1 + 32)];
  }
}

uint64_t __44__FBKFileCollector_addFileFromItemProvider___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) lastPathComponent];
  [v2 setProposedFileNameForLocalFiles:v3];

  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);

  return [v4 _addAttachment:v5];
}

void __44__FBKFileCollector_addFileFromItemProvider___block_invoke_72(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAttachment:*(void *)(a1 + 40) withState:3];
  FBKErrorOfType(-1019);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(a1 + 32) listener];
  [v2 attachmentProvider:*(void *)(a1 + 32) didFinishAttaching:*(void *)(a1 + 40) error:v3];
}

- (void)addFileFromURL:(id)a3 byMoving:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(FBKFileCollector *)self newAttachmentWithType:5];
  uint64_t v8 = [v6 lastPathComponent];
  [v7 setProposedFileNameForLocalFiles:v8];

  id v9 = [(FBKFileCollector *)self _fileProcessingQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__FBKFileCollector_addFileFromURL_byMoving___block_invoke;
  v12[3] = &unk_2648751B0;
  v12[4] = self;
  id v13 = v6;
  BOOL v15 = a4;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, v12);
}

uint64_t __44__FBKFileCollector_addFileFromURL_byMoving___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processFileFromURL:*(void *)(a1 + 40) movingFile:*(unsigned __int8 *)(a1 + 56) forAttachment:*(void *)(a1 + 48)];
}

- (id)existingAttachmentRegexMatchingFile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKFileCollector *)self diagnosticExtensionAttachments];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__FBKFileCollector_existingAttachmentRegexMatchingFile___block_invoke;
  v9[3] = &unk_264875278;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "ded_findWithBlock:", v9);

  return v7;
}

uint64_t __56__FBKFileCollector_existingAttachmentRegexMatchingFile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 requirement];
  int v5 = [v4 hasRegularExpression];

  if (v5 && ([v3 hasFiles] & 1) == 0)
  {
    id v7 = [v3 requirement];
    uint64_t v8 = [v7 fileMatcher];
    id v9 = [*(id *)(a1 + 32) lastPathComponent];
    uint64_t v6 = [v8 matchesFilename:v9];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)diagnosticExtensionAttachments
{
  uint64_t v2 = [(FBKFileCollector *)self deCollector];
  id v3 = [v2 attachments];

  return v3;
}

- (void)processFileFromURL:(id)a3 movingFile:(BOOL)a4 forAttachment:(id)a5
{
  BOOL v6 = a4;
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v8 = (__CFString *)a3;
  id v9 = a5;
  if ([(__CFString *)v8 checkResourceIsReachableAndReturnError:0])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__FBKFileCollector_processFileFromURL_movingFile_forAttachment___block_invoke;
    block[3] = &unk_264874270;
    void block[4] = self;
    id v10 = v9;
    id v50 = v10;
    dispatch_sync(MEMORY[0x263EF83A0], block);
    uint64_t v43 = 0;
    long long v44 = &v43;
    uint64_t v45 = 0x3032000000;
    long long v46 = __Block_byref_object_copy__0;
    v47 = __Block_byref_object_dispose__0;
    id v11 = [(FBKFileCollector *)self submissionDir];
    int8x16_t v12 = [v10 proposedFileNameForLocalFiles];
    id v48 = [v11 URLByAppendingPathComponent:v12];

    id v13 = [(FBKFileCollector *)self diskAccessQueue];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __64__FBKFileCollector_processFileFromURL_movingFile_forAttachment___block_invoke_74;
    v42[3] = &unk_264873E40;
    v42[4] = &v43;
    dispatch_sync(v13, v42);

    id v14 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      BOOL v15 = @"copy";
      id v16 = (void *)v44[5];
      if (v6) {
        BOOL v15 = @"move";
      }
      *(_DWORD *)buf = 138543874;
      v52 = v15;
      __int16 v53 = 2114;
      v54 = v8;
      __int16 v55 = 2114;
      v56 = v16;
      _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_INFO, "Will %{public}@ file url [%{public}@] to [%{public}@] ", buf, 0x20u);
    }

    id v17 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v18 = v44[5];
    if (v6)
    {
      uint64_t v41 = 0;
      v19 = (id *)&v41;
      int v20 = [v17 moveItemAtURL:v8 toURL:v18 error:&v41];
    }
    else
    {
      uint64_t v40 = 0;
      v19 = (id *)&v40;
      int v20 = [v17 copyItemAtURL:v8 toURL:v18 error:&v40];
    }
    int v27 = v20;
    id v28 = *v19;

    if (v28) {
      int v29 = 0;
    }
    else {
      int v29 = v27;
    }
    if (v29 == 1)
    {
      id v30 = [MEMORY[0x263F3A120] itemWithURL:v44[5]];
      id v31 = [MEMORY[0x263F08A48] mainQueue];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __64__FBKFileCollector_processFileFromURL_movingFile_forAttachment___block_invoke_81;
      v36[3] = &unk_2648751D8;
      v36[4] = self;
      id v37 = v10;
      id v32 = v30;
      id v38 = v32;
      uint64_t v39 = v8;
      [v31 addOperationWithBlock:v36];
    }
    else
    {
      id v33 = +[FBKLog attachHandle];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = (__CFString *)v44[5];
        id v35 = [v28 localizedDescription];
        *(_DWORD *)buf = 138543874;
        v52 = v8;
        __int16 v53 = 2114;
        v54 = v34;
        __int16 v55 = 2114;
        v56 = v35;
        _os_log_error_impl(&dword_22A36D000, v33, OS_LOG_TYPE_ERROR, "Failed to process file [%{public}@] to [%{public}@]: %{public}@", buf, 0x20u);
      }
      FBKErrorOfType(-1019);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      [(FBKFileCollector *)self reportAttachingErrorWithAttachment:v10 userFriendlyError:v32];
    }

    _Block_object_dispose(&v43, 8);
  }
  else
  {
    char v21 = [MEMORY[0x263F08850] defaultManager];
    int v22 = [v21 isUbiquitousItemAtURL:v8];

    uint64_t v23 = +[FBKLog attachHandle];
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v24) {
        -[FBKFileCollector processFileFromURL:movingFile:forAttachment:]();
      }

      id v25 = FBKErrorOfType(-1021);
      [(FBKFileCollector *)self reportAttachingErrorWithAttachment:v9 userFriendlyError:v25];
    }
    else
    {
      if (v24) {
        -[FBKFileCollector processFileFromURL:movingFile:forAttachment:]();
      }

      uint64_t v26 = FBKErrorOfType(-1019);
      [(FBKFileCollector *)self reportAttachingErrorWithAttachment:v9 userFriendlyError:v26];
    }
  }
}

void __64__FBKFileCollector_processFileFromURL_movingFile_forAttachment___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) listener];
  [v2 attachmentProvider:*(void *)(a1 + 32) didStartAttaching:*(void *)(a1 + 40)];
}

uint64_t __64__FBKFileCollector_processFileFromURL_movingFile_forAttachment___block_invoke_74(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[FBKFileManager getUniqueDestinationURLForURL:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) alwaysIndex:0];

  return MEMORY[0x270F9A758]();
}

uint64_t __64__FBKFileCollector_processFileFromURL_movingFile_forAttachment___block_invoke_81(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) listener];
  [v2 attachmentProvider:*(void *)(a1 + 32) didFinishAttaching:*(void *)(a1 + 40) error:0];

  [*(id *)(a1 + 40) setItem:*(void *)(a1 + 48) originalURL:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) attachmentDescriptors];
  int v5 = +[FBKAttachment descriptorForAttachment:v3 given:v4];
  uint64_t v6 = [v5 localizedDescription];
  [*(id *)(a1 + 40) setLocalizedAttachmentInfo:v6];

  id v7 = [*(id *)(a1 + 32) _attachments];
  LOBYTE(v6) = [v7 containsObject:*(void *)(a1 + 40)];

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v6)
  {
    return [v8 _updateAttachment:v9 withState:2];
  }
  else
  {
    return [v8 _addAttachment:v9];
  }
}

- (void)reportAttachingErrorWithAttachment:(id)a3 userFriendlyError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F08A48] mainQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__FBKFileCollector_reportAttachingErrorWithAttachment_userFriendlyError___block_invoke;
  v11[3] = &unk_264874EC8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

void __73__FBKFileCollector_reportAttachingErrorWithAttachment_userFriendlyError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) listener];
  [v2 attachmentProvider:*(void *)(a1 + 32) didFinishAttaching:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];

  uint64_t v3 = [*(id *)(a1 + 32) _attachments];
  int v4 = [v3 containsObject:*(void *)(a1 + 40)];

  if (v4)
  {
    int v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    [v5 _updateAttachment:v6 withState:3];
  }
}

- (id)getUniqueFileNameForAttachmentType:(int64_t)a3
{
  int v4 = [(FBKFileCollector *)self attachments];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__FBKFileCollector_getUniqueFileNameForAttachmentType___block_invoke;
  v13[3] = &__block_descriptor_40_e23_B16__0__FBKAttachment_8l;
  void v13[4] = a3;
  int v5 = objc_msgSend(v4, "ded_selectItemsPassingTest:", v13);

  uint64_t v6 = objc_msgSend(v5, "ded_flatMapWithBlock:", &__block_literal_global_84);
  if (a3 == 4)
  {
    id v7 = @".mov";
    uint64_t v8 = @"Video";
  }
  else
  {
    if (a3 != 3)
    {
      id v11 = &stru_26DDF6A30;
      goto LABEL_9;
    }
    id v7 = @".png";
    uint64_t v8 = @"Image";
  }
  id v9 = 0;
  uint64_t v10 = 1;
  do
  {
    id v11 = [(__CFString *)v8 stringByAppendingFormat:@"_%.2d%@", v10, v7];

    uint64_t v10 = (v10 + 1);
    id v9 = v11;
  }
  while (([v6 containsObject:v11] & 1) != 0);
LABEL_9:

  return v11;
}

BOOL __55__FBKFileCollector_getUniqueFileNameForAttachmentType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 attachmentType] == *(void *)(a1 + 32);
}

uint64_t __55__FBKFileCollector_getUniqueFileNameForAttachmentType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 proposedFileNameForLocalFiles];
}

- (void)commitWithForm:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(FBKFileCollector *)self _attachments];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(FBKFileCollector *)self _attachments];
    id v11 = objc_msgSend(v10, "ded_selectItemsPassingTest:", &__block_literal_global_92);

    if ([v11 count])
    {
      id v12 = +[FBKLog attachHandle];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[FBKFileCollector commitWithForm:withCompletion:](v11, v12);
      }

      v7[2](v7, 0);
    }
    else
    {
      id v14 = [(FBKFileCollector *)self _attachments];
      BOOL v15 = objc_msgSend(v14, "ded_flatMapWithBlock:", &__block_literal_global_98);
      id v16 = [v15 allObjects];

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __50__FBKFileCollector_commitWithForm_withCompletion___block_invoke_2;
      v17[3] = &unk_264875300;
      v17[4] = self;
      uint64_t v18 = v7;
      +[FBKDEDHelper sendLocalFilesToDED:v16 withForm:v6 withCompletion:v17];
    }
  }
  else
  {
    id v13 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_DEFAULT, "No local files in file collector: nothing to commit", buf, 2u);
    }

    v7[2](v7, 0);
  }
}

uint64_t __50__FBKFileCollector_commitWithForm_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCollecting];
}

id __50__FBKFileCollector_commitWithForm_withCompletion___block_invoke_96(uint64_t a1, void *a2)
{
  id v2 = [a2 item];
  uint64_t v3 = [v2 attachedPath];

  return v3;
}

void __50__FBKFileCollector_commitWithForm_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __50__FBKFileCollector_commitWithForm_withCompletion___block_invoke_2_cold_1();
    }
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = objc_msgSend(*(id *)(a1 + 32), "_attachments", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) remove];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)saveDraftsDirectory
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_4(&dword_22A36D000, a2, v4, "Failed to created Drafts Directory: [%{public}@]", v5);
}

id __39__FBKFileCollector_saveDraftsDirectory__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 item];
  uint64_t v3 = [v2 attachedPath];

  return v3;
}

- (id)requirements
{
  id v2 = [(FBKFileCollector *)self attachments];
  uint64_t v3 = objc_msgSend(v2, "ded_flatMapWithBlock:", &__block_literal_global_104);

  return v3;
}

uint64_t __32__FBKFileCollector_requirements__block_invoke(uint64_t a1, void *a2)
{
  return [a2 requirement];
}

- (void)updateRequirements:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[a3 mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(FBKFileCollector *)self _attachments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 requirement];

        if (v11)
        {
          long long v12 = [v10 requirement];
          char v13 = [v4 containsObject:v12];

          if (v13)
          {
            long long v14 = [v10 requirement];
            [v4 removeObject:v14];
          }
          else
          {
            [v10 setRequirement:0];
            long long v14 = [(FBKFileCollector *)self listener];
            [v14 attachmentProvider:self didUpdateAttachment:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (BOOL)hasFilePromises
{
  id v2 = [(FBKFileCollector *)self _attachments];
  uint64_t v3 = objc_msgSend(v2, "ded_findWithBlock:", &__block_literal_global_106);
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __35__FBKFileCollector_hasFilePromises__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasFiles]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isCollecting];
  }

  return v3;
}

- (BOOL)hasUnmetRequirements
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [(FBKFileCollector *)self _attachments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v6 hasFiles]) {
          int v7 = 1;
        }
        else {
          int v7 = [v6 isCollecting];
        }
        uint64_t v8 = [v6 requirement];

        if (v8) {
          BOOL v9 = v7 == 0;
        }
        else {
          BOOL v9 = 0;
        }
        if (v9)
        {
          LOBYTE(v3) = 1;
          goto LABEL_17;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v3;
}

- (void)removeAllAttachments
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(FBKFileCollector *)self attachments];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(FBKFileCollector *)self removeAttachment:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)identifier
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)cancelCollection:(id)a3
{
  uint64_t v3 = +[FBKLog attachHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[FBKFileCollector cancelCollection:](v3);
  }
}

- (void)removeAttachment:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[FBKLog attachHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543618;
    id v11 = v4;
    __int16 v12 = 2114;
    long long v13 = self;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_INFO, "Will remove [%{public}@] in [%{public}@]", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v6 = [(FBKFileCollector *)self _attachments];
  int v7 = [v6 containsObject:v4];

  uint64_t v8 = +[FBKLog attachHandle];
  long long v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v4;
      __int16 v12 = 2114;
      long long v13 = self;
      _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "removing [%{public}@] in [%{public}@]", (uint8_t *)&v10, 0x16u);
    }

    [v4 remove];
    [(FBKFileCollector *)self _removeAttachment:v4];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FBKFileCollector removeAttachment:]();
    }
  }
}

- (id)attachments
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [(FBKFileCollector *)self _attachments];
  id v4 = [v2 setWithSet:v3];

  return v4;
}

- (id)platform
{
  id v2 = +[FBKGroupedDevice currentGroupedDevice];
  uint64_t v3 = [v2 platform];

  return v3;
}

- (NSURL)submissionDir
{
  v12[3] = *MEMORY[0x263EF8340];
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(NSURL *)v2->_submissionDir path];
  char v5 = [v3 fileExistsAtPath:v4];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x263F3A0A0] createDirectoryWithClassCDataProtection:v2->_submissionDir];
    if (v6)
    {
      int v7 = +[FBKLog attachHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t submissionDir = (uint64_t)v2->_submissionDir;
        long long v9 = [v6 description];
        [(FBKFileCollector *)submissionDir submissionDir];
      }
    }
  }
  int v10 = v2->_submissionDir;
  objc_sync_exit(v2);

  return v10;
}

- (void)setSubmissionDir:(id)a3
{
  id v4 = (NSURL *)a3;
  id obj = self;
  objc_sync_enter(obj);
  uint64_t submissionDir = obj->_submissionDir;
  obj->_uint64_t submissionDir = v4;

  objc_sync_exit(obj);
}

- (void)_attachURL:(id)a3 toAttachment:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v30 = 0;
    [v6 getResourceValue:&v30 forKey:*MEMORY[0x263EFF6A8] error:0];
    id v8 = v30;
    long long v9 = v8;
    if (v8 && [v8 BOOLValue])
    {
      int v10 = +[FBKLog attachHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = v6;
        _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_DEFAULT, "attaching dir [%{public}@]", buf, 0xCu);
      }

      id v11 = [(FBKFileCollector *)self submissionDir];
      uint64_t v12 = +[FBKFileManager getUniqueDestinationURLForURL:v11 alwaysIndex:0 forSourceURL:v6];
    }
    else
    {
      long long v13 = +[FBKLog attachHandle];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = v6;
        _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_DEFAULT, "attaching file [%{public}@]", buf, 0xCu);
      }

      uint64_t v14 = [(FBKFileCollector *)self submissionDir];
      long long v15 = [v6 lastPathComponent];
      id v11 = [v14 URLByAppendingPathComponent:v15];

      uint64_t v12 = +[FBKFileManager getUniqueDestinationURLForURL:v11 alwaysIndex:0];
    }
    uint64_t v16 = (void *)v12;

    long long v17 = [MEMORY[0x263F3A120] itemWithURL:v16 shouldCheckURLAttributes:0];
    [v7 setItem:v17 originalURL:v6];
    long long v18 = [(FBKFileCollector *)self attachmentDescriptors];
    v19 = +[FBKAttachment descriptorForAttachment:v7 given:v18];
    uint64_t v20 = [v19 localizedDescription];
    [v7 setLocalizedAttachmentInfo:v20];

    [(FBKFileCollector *)self _addAttachment:v7];
    if ([v7 state] != 1) {
      [(FBKFileCollector *)self _updateAttachment:v7 withState:1];
    }
    char v21 = dispatch_get_global_queue(25, 0);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __44__FBKFileCollector__attachURL_toAttachment___block_invoke;
    v24[3] = &unk_264875328;
    id v25 = v9;
    id v26 = v6;
    id v27 = v16;
    id v28 = self;
    id v29 = v7;
    id v22 = v16;
    uint64_t v23 = v9;
    dispatch_async(v21, v24);
  }
  else
  {
    uint64_t v23 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[FBKFileCollector _attachURL:toAttachment:]();
    }
  }
}

void __44__FBKFileCollector__attachURL_toAttachment___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  if (v2 && [v2 BOOLValue])
  {
    uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v24 = 0;
    [v3 copyItemAtURL:v4 toURL:v5 error:&v24];
    id v6 = v24;

    id v7 = *(id *)(a1 + 48);
    if (!v6) {
      goto LABEL_8;
    }
    id v8 = +[FBKLog attachHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __44__FBKFileCollector__attachURL_toAttachment___block_invoke_cold_1((id *)(a1 + 40), (uint64_t)v6, v8);
    }
  }
  else
  {
    long long v9 = (void *)MEMORY[0x263F3A0A0];
    uint64_t v10 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 56) submissionDir];
    id v8 = [*(id *)(a1 + 48) lastPathComponent];
    id v7 = (id)[v9 copyAndReturn:v10 toDir:v6 withNewFileName:v8];
  }

LABEL_8:
  id v11 = +[FBKLog attachHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    long long v13 = [*(id *)(a1 + 64) displayName];
    uint64_t v14 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v26 = v12;
    __int16 v27 = 2114;
    id v28 = v13;
    __int16 v29 = 2114;
    uint64_t v30 = v14;
    _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_DEFAULT, "attached url [%{public}@] to attachment [%{public}@] with file name [%{public}@]", buf, 0x20u);
  }
  long long v15 = [MEMORY[0x263F3A120] itemWithURL:v7];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__FBKFileCollector__attachURL_toAttachment___block_invoke_108;
  block[3] = &unk_2648751D8;
  id v20 = *(id *)(a1 + 64);
  id v21 = v15;
  id v16 = *(id *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 56);
  id v22 = v16;
  uint64_t v23 = v17;
  id v18 = v15;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __44__FBKFileCollector__attachURL_toAttachment___block_invoke_108(uint64_t a1)
{
  [*(id *)(a1 + 32) setItem:*(void *)(a1 + 40) originalURL:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 56) attachmentDescriptors];
  uint64_t v4 = +[FBKAttachment descriptorForAttachment:v2 given:v3];
  uint64_t v5 = [v4 localizedDescription];
  [*(id *)(a1 + 32) setLocalizedAttachmentInfo:v5];

  id v6 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);

  return [v6 _updateAttachment:v7 withState:2];
}

- (void)_addAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKFileCollector *)self _attachments];
  [v5 addObject:v4];

  id v6 = [(FBKFileCollector *)self listener];
  [v6 attachmentProvider:self didAddAttachment:v4];
}

- (void)_updateAttachment:(id)a3 withState:(int64_t)a4
{
  id v6 = a3;
  [v6 setState:a4];
  id v7 = [(FBKFileCollector *)self listener];
  [v7 attachmentProvider:self didUpdateAttachment:v6];
}

- (void)_removeAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKFileCollector *)self _attachments];
  [v5 removeObject:v4];

  id v6 = [(FBKFileCollector *)self listener];
  [v6 attachmentProvider:self didRemoveAttachment:v4];
}

- (FBKAttachmentListenerDelegate)listener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);

  return (FBKAttachmentListenerDelegate *)WeakRetained;
}

- (void)setListener:(id)a3
{
}

- (FBKDECollector)deCollector
{
  return self->_deCollector;
}

- (void)setDeCollector:(id)a3
{
}

- (NSArray)attachmentDescriptors
{
  return self->_attachmentDescriptors;
}

- (void)setAttachmentDescriptors:(id)a3
{
}

- (NSMutableSet)_attachments
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_attachments:(id)a3
{
}

- (FBKFilerForm)filerForm
{
  return self->_filerForm;
}

- (void)setFilerForm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filerForm, 0);
  objc_storeStrong((id *)&self->__attachments, 0);
  objc_storeStrong((id *)&self->_attachmentDescriptors, 0);
  objc_storeStrong((id *)&self->_deCollector, 0);
  objc_destroyWeak((id *)&self->_listener);

  objc_storeStrong((id *)&self->_submissionDir, 0);
}

- (void)addAttachmentWithItemProvider:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "File Collector cannot attach file [%{public}@]", v2, v3, v4, v5, v6);
}

void __45__FBKFileCollector_addImageWithItemProvider___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_4(&dword_22A36D000, a2, v4, "Couldn't load image with error: [%{public}@]", v5);
}

void __45__FBKFileCollector_addImageWithItemProvider___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to write image to URL [%{public}@]", v2, v3, v4, v5, v6);
}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a2 submissionDir];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_3(&dword_22A36D000, a3, v6, "Failed to copy video [%{public}@] to [%{public}@]", (uint8_t *)&v7);
}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_3(&dword_22A36D000, v1, (uint64_t)v1, "Failed to move video [%{public}@] to [%{public}@]", v2);
}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to copy video [%{public}@]: URL not reachable", v2, v3, v4, v5, v6);
}

void __45__FBKFileCollector_addVideoFromItemProvider___block_invoke_cold_4(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_4(&dword_22A36D000, a2, v4, "Couldn't load video with error: [%{public}@]", v5);
}

void __44__FBKFileCollector_addFileFromItemProvider___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_4(&dword_22A36D000, a2, v4, "Couldn't load file from item provider with error: [%{public}@]", v5);
}

- (void)processFileFromURL:movingFile:forAttachment:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to download Ubiquitous Item %@", v2, v3, v4, v5, v6);
}

- (void)processFileFromURL:movingFile:forAttachment:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "Failed to process file [%{public}@]: URL not reachable", v2, v3, v4, v5, v6);
}

- (void)commitWithForm:(void *)a1 withCompletion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 valueForKeyPath:@"displayName"];
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_22A36D000, a2, OS_LOG_TYPE_FAULT, "local File Attachments [%{public}@] are still gathering, cannot submit these files", v4, 0xCu);
}

void __50__FBKFileCollector_commitWithForm_withCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "error sending local files to DED: [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)cancelCollection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "cancelCollection not supported for file collector", v1, 2u);
}

- (void)removeAttachment:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_3(&dword_22A36D000, v1, (uint64_t)v1, "[%{public}@] cannot remove [%{public}@]: Attachment not found", v2);
}

- (void)submissionDir
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3(&dword_22A36D000, a4, a3, "Failed to create draft directory [%{public}@] with error %{public}@", (uint8_t *)a3);
}

- (void)_attachURL:toAttachment:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "cannot copy URL for attachment [%{public}@]: URL is nil", v2, v3, v4, v5, v6);
}

void __44__FBKFileCollector__attachURL_toAttachment___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a1 path];
  OUTLINED_FUNCTION_5();
  uint64_t v8 = a2;
  OUTLINED_FUNCTION_3(&dword_22A36D000, a3, v6, "Failed to copy item at URL [%{public}@] error: [%{public}@]", v7);
}

@end